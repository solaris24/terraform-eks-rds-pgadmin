################################################
# Project
################################################

//variable "project_name" {
//  description = "Project name"
//  type        = string
//
//  validation {
//    condition     = length(var.project_name) >= 3 && var.project_name != null && var.project_name != ""
//    error_message = "Error: Incorrect project name."
//  }
//}

variable "env" {
  description = "Environment name for deployment"
  type        = string
  default     = "dev"

  validation {
    condition     = can(regex("^[[:alnum:]]*", var.env))
    error_message = "Error: Incorrect environment name. Name should be in format $name*."
  }
}

variable "eks_name" {
  description = "eks_name"
  type        = string
}

variable "eks_version" {
  description = "eks_version"
  type        = string
}


variable "state_bucket" {
  description = "state_bucket"
  type        = string
}

variable "key" {
  description = "state_bucket"
  type        = string
}

variable "dynamodb_table" {
  description = "dynamodb_table"
  type        = string
}

variable "region" {
  description = "aws_region"
  type        = string
}

variable "zone1" {
  description = "aws_zone1"
  type        = string
}

variable "zone2" {
  description = "aws_zone2"
  type        = string
}


variable "rds_password" {
  description = "rds_password"
  type        = string
}
