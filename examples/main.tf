module "kuberos" {
  source = "../"
  # check the latest release on
  # source = "github.com/ministryofjustice/cloud-platform-terraform-kuberos?ref=0.3.6"

  cluster_domain_name = "test.com"
  # cluster_domain_name           = data.terraform_remote_state.cluster.outputs.cluster_domain_name
  oidc_kubernetes_client_id = "test"
  # oidc_kubernetes_client_id     = data.terraform_remote_state.cluster.outputs.oidc_kubernetes_client_id
  oidc_kubernetes_client_secret = "test"
  # oidc_kubernetes_client_secret = data.terraform_remote_state.cluster.outputs.oidc_kubernetes_client_secret
  oidc_issuer_url = "https://test"
  # oidc_issuer_url               = data.terraform_remote_state.cluster.outputs.oidc_issuer_url
  cluster_address = "https://test"
  # cluster_address               = data.terraform_remote_state.cluster.outputs.cluster_endpoint

  image_tag = "0.4.0"
  # depends_on = [module.ingress_controllers]
}
