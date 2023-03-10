
terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    local    = ">= 1.4"
    null     = ">= 2.1"
    template = ">= 2.1"
  }
}
