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

  # Pass values for module variables for "aws_rds_cluster" "create_primary_cluster"
  input-db_subnet_group_name = "cxy-terraform-private-subnet-group"
  input-publicly_accessible = true

  input-cluster_identifier   = "testtestsys-db-test6"
  input-db_engine            = "aurora-postgresql"
  input-db_engine_version    = "13.6"

  # optional argument, but will cause error if uncomment 
  # input-db_engine_mode      = "serverless"

  input-database_name                       = "cxy_testtestsys_db6"
  input-master_username                     = var.input-master_username
  input-master_password                     = var.input-master_password
  input-skip_final_snapshot                 = true
  input-storage_encrypted                   = true
  input-iam_database_authentication_enabled = true
  input-max_capacity                        = 1.0
  input-min_capacity                        = 0.5

  # Pass values for module variables for:
  #   - "aws_rds_cluster_instance" "create_primary_instance_in_cluster"
  #   - "aws_rds_cluster_instance" "create_secondary_instance_in_cluster"
  input-primary_db_instance_identifier = "testtestsys-db-test-primary6"
  # input-secondary_db_instance_identifier = "testtestsys-db-test-secondary6"
  input-db_instance_class   = "db.serverless"
  input-kms_key_arn         = module.kms.return-kms_key_arn
}
