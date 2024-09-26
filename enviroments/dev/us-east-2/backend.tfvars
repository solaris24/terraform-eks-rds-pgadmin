# https://brendanthompson.com/posts/2021/10/dynamic-terraform-backend-configuration
#
bucket = "aws-terraform-states-backend-demo-paretos"
key    = "backend/terraform.tfstate"
dynamodb_table = "aws-terraform-states-lock1"
region = "us-east-2"
