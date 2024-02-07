locals {
  live_workspace   = "live"
  live_domain      = "cloud-platform.service.justice.gov.uk"
  ingress_redirect = terraform.workspace == local.live_workspace ? true : false
  kuberos_root = format(
    "%s.%s",
    "login",
    var.cluster_domain_name,
  )
}

#############
# Namespace #
#############

resource "kubernetes_namespace" "kuberos" {
  metadata {
    name = "kuberos"

    labels = {
      "name"                                           = "kuberos"
      "cloud-platform.justice.gov.uk/environment-name" = "production"
      "cloud-platform.justice.gov.uk/is-production"    = "true"
      "pod-security.kubernetes.io/enforce"             = "privileged"
    }

    annotations = {
      "cloud-platform.justice.gov.uk/application"   = "Kuberos"
      "cloud-platform.justice.gov.uk/business-unit" = "Platforms"
      "cloud-platform.justice.gov.uk/owner"         = "Cloud Platform: platforms@digital.justice.gov.uk"
      "cloud-platform.justice.gov.uk/source-code"   = "https://github.com/ministryofjustice/kuberos"
      "cloud-platform.justice.gov.uk/slack-channel" = "cloud-platform"
      "cloud-platform-out-of-hours-alert"           = "true"
    }
  }
}

resource "helm_release" "kuberos" {
  name          = "kuberos"
  namespace     = kubernetes_namespace.kuberos.id
  chart         = "kuberos"
  repository    = "https://ministryofjustice.github.io/cloud-platform-helm-charts"
  recreate_pods = true
  version       = "0.4.0"

  values = [templatefile("${path.module}/templates/kuberos.yaml.tpl", {
    hostname = terraform.workspace == local.live_workspace ? format("%s.%s", "login", local.live_domain) : format(
      "%s.%s",
      "login",
      var.cluster_domain_name,
    )
    cluster_name    = var.cluster_domain_name
    cluster_address = var.cluster_address
    issuer_url      = var.oidc_issuer_url
    replicaCount    = 2
    clusterName     = terraform.workspace
  })]

  set_sensitive {
    name  = "oidc.clientId"
    value = var.oidc_kubernetes_client_id
  }

  set_sensitive {
    name  = "oidc.clientSecret"
    value = var.oidc_kubernetes_client_secret
  }
  lifecycle {
    ignore_changes = [keyring]
  }
}

####################
# Network Policies #
####################

resource "kubernetes_network_policy" "default" {
  metadata {
    name      = "default"
    namespace = kubernetes_namespace.kuberos.id
  }

  spec {
    pod_selector {}
    ingress {
      from {
        pod_selector {}
      }
    }

    policy_types = ["Ingress"]
  }
}

resource "kubernetes_network_policy" "allow_ingress_controllers" {
  metadata {
    name      = "allow-ingress-controllers"
    namespace = kubernetes_namespace.kuberos.id
  }

  spec {
    pod_selector {}
    ingress {
      from {
        namespace_selector {
          match_labels = {
            component = "ingress-controllers"
          }
        }
      }
    }

    policy_types = ["Ingress"]
  }
}

##################
# Resource Quota #
##################

resource "kubernetes_resource_quota" "namespace_quota" {
  metadata {
    name      = "namespace-quota"
    namespace = kubernetes_namespace.kuberos.id
  }
  spec {
    hard = {
      pods = 50
    }
  }
}

##############
# LimitRange #
##############

resource "kubernetes_limit_range" "kuberos" {
  metadata {
    name      = "limitrange"
    namespace = kubernetes_namespace.kuberos.id
  }
  spec {
    limit {
      type = "Container"
      default = {
        cpu    = "20m"
        memory = "500Mi"
      }
      default_request = {
        cpu    = "2m"
        memory = "50Mi"
      }
    }
  }
}

###########
# Ingress #
###########

# This is to redirect "https://login.live.cloud-platform.service.justice.gov.uk/" to
# "https://login.cloud-platform.service.justice.gov.uk/"

resource "kubernetes_ingress_v1" "ingress_redirect_kuberos" {
  count = local.ingress_redirect ? 1 : 0
  metadata {
    name      = "ingress-redirect-kuberos"
    namespace = kubernetes_namespace.kuberos.id
    annotations = {
      "cloud-platform.justice.gov.uk/ignore-external-dns-weight" = "true"
      "nginx.ingress.kubernetes.io/permanent-redirect"           = "https://login.${local.live_domain}"
    }
  }
  spec {
    ingress_class_name = "default"
    tls {
      hosts = [local.kuberos_root]
    }
    rule {
      host = local.kuberos_root
      http {
        path {
          path = ""
          backend {
            service {
              name = "kuberos"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
