terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  # backend "s3" {
  #   encrypt        = true
  #   bucket         = "bmaddi-tf-statefile-dev"
  #   dynamodb_table = "terraform-state-lock-dynamo-dev"
  #   key            = "terraform.tfstate"
  #   region         = var.region
  # }
}
