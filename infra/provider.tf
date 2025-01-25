provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "aviv-tf-state"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}