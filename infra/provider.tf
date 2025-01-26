provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      managed_by = "terraform"
      region     = var.aws_region
    }
  }
}

terraform {
  backend "s3" {
    bucket = "aviv-tf-state"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}