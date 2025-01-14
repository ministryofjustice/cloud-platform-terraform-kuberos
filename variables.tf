variable "cluster_domain_name" {
  description = "The cluster domain - used by kuberos"
}

variable "cluster_address" {
  description = "The cluster address - used by kuberos"
}

variable "oidc_kubernetes_client_id" {
  description = "OIDC ClientID used to authenticate to kuberos"
}

variable "oidc_kubernetes_client_secret" {
  description = "OIDC ClientSecret used to authenticate to kuberos"
}

variable "oidc_issuer_url" {
  description = "Issuer URL used to authenticate to kuberos"
}

variable "image_tag" {
  description = "The image tag to use for the kuberos deployment"
}

variable "replica_count" {
  description = "the num of replicas for kuberos"
  default     = 2
  type        = number
}
