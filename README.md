# cloud-platform-terraform-kuberos

<a href="https://github.com/ministryofjustice/cloud-platform-terraform-kuberos/releases">
  <img src="https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-kuberos/all.svg" alt="Releases" />
</a>

Terraform module that deploy cloud-platform kuberos. Kuberos is an OIDC authentication helper for Kubernetes kubectl which enables users to authenticate and perform queries against the clusters API. 

## Usage

See the [examples/](examples/) folder.

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >=2.6.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >=2.12.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >=2.6.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >=2.12.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.kuberos](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_ingress_v1.ingress_redirect_kuberos](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1) | resource |
| [kubernetes_limit_range.kuberos](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/limit_range) | resource |
| [kubernetes_namespace.kuberos](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_network_policy.allow_ingress_controllers](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.default](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_resource_quota.namespace_quota](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/resource_quota) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_address"></a> [cluster\_address](#input\_cluster\_address) | The cluster address - used by kuberos | `any` | n/a | yes |
| <a name="input_cluster_domain_name"></a> [cluster\_domain\_name](#input\_cluster\_domain\_name) | The cluster domain - used by kuberos | `any` | n/a | yes |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | The image tag to use for the kuberos deployment | `any` | n/a | yes |
| <a name="input_oidc_issuer_url"></a> [oidc\_issuer\_url](#input\_oidc\_issuer\_url) | Issuer URL used to authenticate to kuberos | `any` | n/a | yes |
| <a name="input_oidc_kubernetes_client_id"></a> [oidc\_kubernetes\_client\_id](#input\_oidc\_kubernetes\_client\_id) | OIDC ClientID used to authenticate to kuberos | `any` | n/a | yes |
| <a name="input_oidc_kubernetes_client_secret"></a> [oidc\_kubernetes\_client\_secret](#input\_oidc\_kubernetes\_client\_secret) | OIDC ClientSecret used to authenticate to kuberos | `any` | n/a | yes |

## Outputs

No outputs.

<!--- END_TF_DOCS --->

## Reading Material

Click [here](https://github.com/helm/charts/tree/master/stable/kuberos#configuration) for the kuberos documentation.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >=2.6.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >=2.12.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | >=2.6.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >=2.12.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.kuberos](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_ingress_v1.ingress_redirect_kuberos](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1) | resource |
| [kubernetes_limit_range.kuberos](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/limit_range) | resource |
| [kubernetes_namespace.kuberos](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_network_policy.allow_ingress_controllers](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.default](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_resource_quota.namespace_quota](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/resource_quota) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_address"></a> [cluster\_address](#input\_cluster\_address) | The cluster address - used by kuberos | `any` | n/a | yes |
| <a name="input_cluster_domain_name"></a> [cluster\_domain\_name](#input\_cluster\_domain\_name) | The cluster domain - used by kuberos | `any` | n/a | yes |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | The image tag to use for the kuberos deployment | `any` | n/a | yes |
| <a name="input_oidc_issuer_url"></a> [oidc\_issuer\_url](#input\_oidc\_issuer\_url) | Issuer URL used to authenticate to kuberos | `any` | n/a | yes |
| <a name="input_oidc_kubernetes_client_id"></a> [oidc\_kubernetes\_client\_id](#input\_oidc\_kubernetes\_client\_id) | OIDC ClientID used to authenticate to kuberos | `any` | n/a | yes |
| <a name="input_oidc_kubernetes_client_secret"></a> [oidc\_kubernetes\_client\_secret](#input\_oidc\_kubernetes\_client\_secret) | OIDC ClientSecret used to authenticate to kuberos | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->