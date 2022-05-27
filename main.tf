# Call module to create aurora cluster and instances
module "kms" {
  source = "./modules/kms"
  # arn:aws:iam::327143400501:user/terraform-iam-user3

  input-aws_account_id = "327143400501"
  input_environment = var.region
  input-aws_account_name="terraform-iam-user3"
  input-kms_key_alias="this-terraform-created-key2"
}

# Call module to create aurora cluster and instances
module "aurora" {
  source = "./modules/aurora"

  # Pass values for module variables for "aws_rds_cluster" "create_primary_cluster"
  input-db_subnet_group_name = "cxy-terraform-created-subnet-group"
  input-cluster_identifier  = "testtestsys-db-test4"
  input-db_engine           = "aurora-postgresql"
  input-db_engine_version   = "13.6"

  # optional argument, but will cause error if uncomment 
  # input-db_engine_mode      = "serverless"

  input-database_name       = "cxy_testtestsys_db"
  input-master_username     = var.db_username
  input-master_password     = var.db_password
  input-skip_final_snapshot = true
  input-max_capacity        = 1.0
  input-min_capacity        = 0.5

  # Pass values for module variables for:
  #   - "aws_rds_cluster_instance" "create_primary_instance_in_cluster"
  #   - "aws_rds_cluster_instance" "create_secondary_instance_in_cluster"
  input-primary_db_instance_identifier = "testtestsys-db-test-primary-4"
  # input-secondary_db_instance_identifier = "testtestsys-db-test-secondary-4"
  input-db_instance_class = "db.serverless"
  input-publicly_accessible = false
  input-kms_key_arn = module.kms.return-kms_key_arn
}
