#################### Create Cluster ####################
# Create the cluster to contain db instances
resource "aws_rds_cluster" "create_primary_cluster" {
  # This section is for networking related:
  db_subnet_group_name = var.input-db_subnet_group_name

  # This section specify what kind of DB
  # e.g. postgres v13.6, mySql 10.*
  cluster_identifier = var.input-cluster_identifier
  engine             = var.input-db_engine
  engine_version     = var.input-db_engine_version

  # optional argument, but will cause error if uncomment
  # engine_mode        = var.input-db_engine_mode

  database_name   = var.input-database_name
  master_username = var.input-master_username
  master_password = var.input-master_password

  # During deletion of cluster, there will be a prompt to create a final snapshot
  # without this, it will cause the following error during destory:
  #   + Terraform error - RDS Cluster FinalSnapshotIdentifier is required when a final snapshot is required
  skip_final_snapshot = var.input-skip_final_snapshot

  # Specifying encryption
  kms_key_id        = var.input-kms_key_arn
  storage_encrypted = var.input-storage_encrypted

  # enable IAM authentication
  iam_database_authentication_enabled = var.input-iam_database_authentication_enabled

  serverlessv2_scaling_configuration {
    max_capacity = var.input-max_capacity
    min_capacity = var.input-min_capacity
  }

  # vpc_security_group_ids = ["sg-00c55f622a2f4d050"]
}

#################### Create Instances Under Cluster ####################
resource "aws_rds_cluster_instance" "create_primary_instance_in_cluster" {
  cluster_identifier = aws_rds_cluster.create_primary_cluster.id

  identifier          = var.input-primary_db_instance_identifier
  instance_class      = var.input-db_instance_class
  engine              = var.input-db_engine
  engine_version      = var.input-db_engine_version
  publicly_accessible = var.input-publicly_accessible
}

# resource "aws_rds_cluster_instance" "create_secondary_instance_in_cluster" {
#   cluster_identifier  = aws_rds_cluster.create_primary_cluster.id

#   identifier          = var.input-secondary_db_instance_identifier
#   instance_class      = var.input-db_instance_class
#   engine              = var.input-db_engine
#   engine_version      = var.input-db_engine_version
#   publicly_accessible = var.input-publicly_accessible
# }
