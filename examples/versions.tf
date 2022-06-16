terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.9.0"
    }
  }
  required_version = ">= 0.14"
}
