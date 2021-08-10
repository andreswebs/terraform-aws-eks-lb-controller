module "aws_lb_controller_iam" {
  source                = "github.com/andreswebs/terraform-aws-eks-lb-controller//modules/iam"
  cluster_oidc_provider = var.cluster_oidc_provider
  iam_role_name         = "eks-lb-controller-${var.eks_cluster_id}"
}