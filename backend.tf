terraform {
  backend "s3" {
  }
}

# This is command is being used for multiple environment.
# terraform init -backend-config=bucket=terraform.staging.us-east-1.state -backend-config=key=client/staging/rds/terraform.tfvars -backend-config=region=us-east-1 -backend-config=profile=client -backend-config=dynamodb_table=terraform.staging.us-east-1.state
