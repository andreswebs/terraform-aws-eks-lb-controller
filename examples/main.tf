module "aws_lb_controller" {
  source                          = "github.com/andreswebs/terraform-aws-eks-lb-controller"
  cluster_name                    = var.eks_cluster_id
  cluster_oidc_provider           = var.eks_cluster_oidc_provider
  iam_role_name                   = "eks-lb-controller-${var.eks_cluster_id}"
  chart_version_aws_lb_controller = var.chart_version_aws_lb_controller
}
