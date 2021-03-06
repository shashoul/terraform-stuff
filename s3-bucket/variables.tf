##################################################################################
# VARIABLES
##################################################################################

variable "region" {
  default = "us-east-1"
}

variable "bucket_name_prefix" {}

##################################################################################
# LOCALS
##################################################################################

locals {
  env_name = lower(terraform.workspace)

  s3_bucket_name = "${var.bucket_name_prefix}-${local.env_name}"


}