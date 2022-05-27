variable "input-aws_account_id" {
  type        = string
  description = "AWS Account ID where this Terraform is applied to"
}

variable "input_environment" {
  type = string
}

variable "input-aws_account_name" {
  type        = string
  description = "Name of the account to create the key"
  default = ""
}

variable "input-kms_key_alias" {
  type        = string
  description = "The alias of the key"
}