# Call module to create aurora cluster and instances
module "kms" {
  source = "./modules/kms"

  input-aws_account_id   = var.input-aws_account_id
  input-aws_account_name = var.input-aws_account_name
  input-kms_key_alias    = var.input-kms_key_alias
}

# Call module to create aurora cluster and instances
module "aurora" {
  source = "./modules/aurora"

  input-db_subnet_group_name = var.input-db_subnet_group_name
  input-publicly_accessible  = var.input-publicly_accessible

  input-cluster_identifier = var.input-cluster_identifier
  input-db_engine          = var.input-db_engine
  input-db_engine_version  = var.input-db_engine_version

  input-database_name                       = var.input-database_name
  input-master_username                     = var.input-master_username
  input-master_password                     = var.input-master_password
  input-skip_final_snapshot                 = var.input-skip_final_snapshot
  input-storage_encrypted                   = var.input-storage_encrypted
  input-iam_database_authentication_enabled = var.input-iam_database_authentication_enabled
  input-max_capacity                        = var.input-max_capacity
  input-min_capacity                        = var.input-min_capacity

  input-primary_db_instance_identifier   = var.input-primary_db_instance_identifier
  input-secondary_db_instance_identifier = var.input-secondary_db_instance_identifier
  input-db_instance_class                = var.input-db_instance_class
  
  input-kms_key_arn                      = module.kms.return-kms_key_arn
}
