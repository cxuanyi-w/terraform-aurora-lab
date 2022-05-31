# Provider variables
variable "input-region" {}

# Declare KMS module variables
variable "input-aws_account_id" {}
variable "input-aws_account_name" {}
variable "input-kms_key_alias" {}

# Declare Database variables
variable "input-db_subnet_group_name" {}
variable "input-publicly_accessible" {}
variable "input-cluster_identifier" {}
variable "input-db_engine" {}
variable "input-db_engine_version" {}
variable "input-database_name" {}
variable "input-master_username" {}
variable "input-master_password" {}
variable "input-skip_final_snapshot" {}
variable "input-storage_encrypted" {}
variable "input-iam_database_authentication_enabled" {}
variable "input-max_capacity" {}
variable "input-min_capacity" {}
variable "input-primary_db_instance_identifier" {}
variable "input-secondary_db_instance_identifier" {}
variable "input-db_instance_class" {}