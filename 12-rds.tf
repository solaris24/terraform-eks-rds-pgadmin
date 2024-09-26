module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.7.0"

  identifier = "${var.env}-rds"
  
  engine               = "postgres"
  engine_version       = "14"
  family               = "postgres14" # DB parameter group
  major_engine_version = "14"         # DB option group
  instance_class       = "db.t3.micro"
  storage_encrypted    = false
  allocated_storage = 20

  # DBName must begin with a letter and contain only alphanumeric characters
  db_name  = "${var.env}_pgadmin_db"
  username = "${var.env}_pgadmin_user"
  password = "${var.rds_password}"
  port     = 5432

  manage_master_user_password          = false
  manage_master_user_password_rotation = false

  iam_database_authentication_enabled = false

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id]

  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 0

  depends_on = [
    aws_vpc.main,
    aws_db_subnet_group.rds_subnet_group

  ]
}