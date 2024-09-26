resource "aws_default_security_group" "vpc_security_group" {
  vpc_id = aws_vpc.main.id

  # allow all inbound traffic 
  ingress {
    protocol  = -1
    from_port = 0
    to_port   = 0
    self      = true
  }

  # allow all outbound traffic
  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-vpc-default-sg"
  }
}

resource "aws_security_group_rule" "rds_instances_sg" {
  security_group_id = aws_default_security_group.vpc_security_group.id
  type      = "ingress"
  protocol  = "tcp"
  from_port = 5432
  to_port   = 5432

  source_security_group_id = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
  
  lifecycle {
    create_before_destroy = true
  }
}