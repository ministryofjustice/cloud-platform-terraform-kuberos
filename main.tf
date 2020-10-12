locals {
  live_workspace = "live-1"
  live_domain    = "cloud-platform.service.justice.gov.uk"
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
    }

    annotations = {
      "cloud-platform.justice.gov.uk/application"   = "Kuberos"
      "cloud-platform.justice.gov.uk/business-unit" = "cloud-platform"
      "cloud-platform.justice.gov.uk/owner"         = "Cloud Platform: platforms@digital.justice.gov.uk"
      "cloud-platform.justice.gov.uk/source-code"   = "https://github.com/ministryofjustice/kuberos"
      "cloud-platform.justice.gov.uk/slack-channel" = "cloud-platform"
    }
  }
}

# cloud platform helm chart repository
data "helm_repository" "cloud_platform" {
  name = "cloud-platform"
  url  = "https://ministryofjustice.github.io/cloud-platform-helm-charts"
}


resource "helm_release" "kuberos" {
  name          = "kuberos"
  namespace     = kubernetes_namespace.kuberos.id
  chart         = "kuberos"
  repository    = data.helm_repository.cloud_platform.metadata[0].name
  recreate_pods = true
  version       = "0.2.0"

  values = [templatefile("${path.module}/templates/kuberos.yaml.tpl", {
    hostname = terraform.workspace == local.live_workspace ? format("%s.%s", "login", local.live_domain) : format(
      "%s.%s",
      "login.apps",
      var.cluster_domain_name,
    )
    cluster_name    = var.cluster_domain_name
    cluster_address = var.cluster_address
    issuer_url      = var.oidc_issuer_url
    client_id       = var.oidc_kubernetes_client_id
    client_secret   = var.oidc_kubernetes_client_secret
    replicaCount    = 2
  })]

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
    name = "namespace-quota"
    namespace = kubernetes_namespace.kuberos.id
  }
  spec {
    hard = {
      pods = 50
    }
  }
}

