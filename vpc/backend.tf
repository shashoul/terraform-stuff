terraform {
  backend "s3" {
    bucket         = "clewmed-terraform-state"
    key            = "vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "clewmed-terraform-statelock"
  }
}