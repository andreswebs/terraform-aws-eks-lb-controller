module "aws_lb_controller_resources" {
  source                          = "github.com/andreswebs/terraform-aws-eks-lb-controller//modules/resources"
  cluster_name                    = var.eks_cluster_id
  iam_role_arn                    = var.aws_lb_controller_iam_role_arn
  chart_version_aws_lb_controller = var.chart_version_aws_lb_controller
}