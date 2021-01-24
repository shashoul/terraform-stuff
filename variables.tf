##################################################################################
# VARIABLES
##################################################################################

variable "region" {
    default = "us-east-1"
}

#Bucket variables
variable "aws_bucket_prefix" {
  type    = string
  default = "clewmed-terraform-state"
}

variable "aws_dynamodb_table" {
  type    = string
  default = "clewmed-terraform-statelock"
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

locals {

  #dynamodb_table_name = "${var.aws_dynamodb_table}-${random_integer.rand.result}"
  #bucket_name         = "${var.aws_bucket_prefix}-${random_integer.rand.result}"
  dynamodb_table_name = "${var.aws_dynamodb_table}"
  bucket_name         = "${var.aws_bucket_prefix}"
}