output "eks_init" {
  value       = "aws eks update-kubeconfig --name ${var.env}-${var.eks_name} --region ${var.region}"
  description = "Run the following command to connect to the EKS cluster."
}

output "eks_cluster_security_group_id" {
  value = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.rds.db_instance_address
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.rds.db_instance_endpoint
}

output "db_instance_master_user_secret_arn" {
  description = "The ARN of the master user secret (Only available when manage_master_user_password is set to true)"
  value       = module.rds.db_instance_master_user_secret_arn
}