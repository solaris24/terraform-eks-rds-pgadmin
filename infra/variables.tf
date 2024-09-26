
variable "dynamodb_table" {
  description = "dynamodb table for locking the state file"
}

variable "state_bucket" {
  description = "S3 Remote Terraform State Store"
}

variable "key" {
  description = "S3 Remote Terraform State Store Key"
}