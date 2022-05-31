# Initialize region
input-region = "ap-southeast-1"

# Initialize KMS module variables
input-aws_account_id   = "327143400501"
input-aws_account_name = "terraform-iam-user5"
input-kms_key_alias    = "this-terraform-created-key6"

# Initialize Aurora module variables
input-db_subnet_group_name = "tf-created-private-subnet-group"
input-publicly_accessible  = false

input-cluster_identifier = "testtestsys-db-test6"
input-db_engine          = "aurora-postgresql"
input-db_engine_version  = "13.6"

input-database_name                       = "cxy_testtestsys_db6"
input-master_username                     = "hdb_aurora_db_user"
input-master_password                     = "Testtest-password123"
input-skip_final_snapshot                 = true
input-storage_encrypted                   = true
input-iam_database_authentication_enabled = true
input-max_capacity                        = 1.0
input-min_capacity                        = 0.5

input-primary_db_instance_identifier = "testtestsys-db-test-primary6"
input-secondary_db_instance_identifier = "testtestsys-db-test-secondary6"
input-db_instance_class   = "db.serverless"