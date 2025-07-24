terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">=3.0.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.12.1"
    }
  }
  required_version = ">= 1.2.5"
}
