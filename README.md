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
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| helm | n/a |
| kubernetes | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [helm_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) |
| [kubernetes_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress) |
| [kubernetes_limit_range](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/limit_range) |
| [kubernetes_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) |
| [kubernetes_network_policy](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) |
| [kubernetes_resource_quota](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/resource_quota) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_address | The cluster address - used by kuberos | `any` | n/a | yes |
| cluster\_domain\_name | The cluster domain - used by kuberos | `any` | n/a | yes |
| oidc\_issuer\_url | Issuer URL used to authenticate to kuberos | `any` | n/a | yes |
| oidc\_kubernetes\_client\_id | OIDC ClientID used to authenticate to kuberos | `any` | n/a | yes |
| oidc\_kubernetes\_client\_secret | OIDC ClientSecret used to authenticate to kuberos | `any` | n/a | yes |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Reading Material

Click [here](https://github.com/helm/charts/tree/master/stable/kuberos#configuration) for the kuberos documentation.