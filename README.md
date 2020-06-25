# cloud-platform-terraform-kuberos

<a href="https://github.com/ministryofjustice/cloud-platform-terraform-kuberos/releases">
  <img src="https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-kuberos/all.svg" alt="Releases" />
</a>

Terraform module that deploy cloud-platform kuberos. Kuberos is an OIDC authentication helper for Kubernetes kubectl which enables users to authenticate and perform queries against the clusters API. 

## Usage

```hcl
module "kuberos" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-kuberos?ref=0.0.1"

  cluster_domain_name           = data.terraform_remote_state.cluster.outputs.cluster_domain_name
  oidc_kubernetes_client_id     = data.terraform_remote_state.cluster.outputs.oidc_kubernetes_client_id
  oidc_kubernetes_client_secret = data.terraform_remote_state.cluster.outputs.oidc_kubernetes_client_secret
  oidc_issuer_url               = data.terraform_remote_state.cluster.outputs.oidc_issuer_url
  cluster_address               = "https://api.${data.terraform_remote_state.cluster.outputs.cluster_domain_name}"
}

```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster_domain_name          | The cluster domain - used by kuberos               | string | | yes |
| cluster_address              | The cluster domain - used by kuberos              | string | | yes |
| oidc_components_client_id    | OIDC ClientID used to authenticate to kuberos) | string | | yes |
| oidc_components_client_secret | OIDC ClientSecret used to authenticate to kuberos) | string | | yes |
| oidc_issuer_url              | Issuer URL used to authenticate to kuberos) | string | | yes |

## Reading Material

Click [here](https://github.com/helm/charts/tree/master/stable/kuberos#configuration) for the kuberos documentation.