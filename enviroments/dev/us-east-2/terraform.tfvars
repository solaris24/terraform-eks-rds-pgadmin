
# Project
state_bucket = "aws-terraform-states-backend-demo-paretos"
key    = "backend/terraform.tfstate"
dynamodb_table = "aws-terraform-states-lock1"


# Env
env         = "dev"
region      = "us-east-2"
zone1       = "us-east-2a"
zone2       = "us-east-2b"
eks_name    = "demo"
eks_version = "1.30"

# RDS

rds_password = "sdf3236tG56ygs"