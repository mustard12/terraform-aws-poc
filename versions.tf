terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    gitlab = {
      source = "gitlabhq/gitlab"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    null = {
      source = "hashicorp/null"
    }
  }
  required_version = ">= 0.13"
}
