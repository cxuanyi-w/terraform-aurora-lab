# Variables for "aws_rds_cluster" "create_primary_cluster" 
variable "input-db_subnet_group_name" {
  default = ""
}
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

# Variables for "aws_rds_cluster_instance" "create_primary_instance_in_cluster"
variable "input-primary_db_instance_identifier" {}
# variable "input-secondary_db_instance_identifier" {}
variable "input-db_instance_class" {}
variable "input-publicly_accessible" {}

# Variables to apply encryption
variable "input-kms_key_arn" {}
