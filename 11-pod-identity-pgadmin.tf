data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "pgadmin_rds_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}

resource "aws_iam_role" "pgadmin_rds_role" {
  name               = "${var.env}-pgadmin-rds-role"
  assume_role_policy = data.aws_iam_policy_document.pgadmin_rds_policy.json
}

resource "aws_iam_role_policy_attachment" "pgadmin_rds_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
  role       = aws_iam_role.pgadmin_rds_role.name
}

resource "aws_eks_pod_identity_association" "pgadmin_rds_role" {
  cluster_name    = aws_eks_cluster.eks.name
  namespace       = "${var.env}-pgadmin"
  service_account = "eks-pgadmin-sa"
  role_arn        = aws_iam_role.pgadmin_rds_role.arn
}



