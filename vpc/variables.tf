##################################################################################
# VARIABLES
##################################################################################

variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.200.0.0/16"
}

variable "subnet1_cidr" {
  default = "10.200.1.0/24"
}

variable "subnet_cidr" {
  type    = list(string)
  default = ["10.200.1.0/24", "10.200.2.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

##################################################################################
# LOCALS
##################################################################################

locals {
  env_name = lower(terraform.workspace)

}