data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket  = var.remote_bucket
    key     = var.remote_bucket_key
    region  = var.aws_region
    profile = var.aws_profile
  }
}

data "aws_availability_zones" "available" {}

data "aws_caller_identity" "current" {}