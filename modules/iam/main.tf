/**
* Deploys IAM resources for the AWS Load Balancer Controller.
*/

terraform {
  required_version = ">= 1.0.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.48.0"
    }

  }
}

locals {
  iam_role_name = var.iam_role_name == "" ? null : var.iam_role_name
}

module "assume_role_policy" {
  source                = "andreswebs/eks-irsa-policy-document/aws"
  version               = "1.0.0"
  cluster_oidc_provider = var.cluster_oidc_provider
  k8s_sa_namespace      = var.k8s_namespace
  k8s_sa_name           = var.k8s_sa_name
}

resource "aws_iam_role" "aws_lb_controller" {
  name                  = local.iam_role_name
  assume_role_policy    = module.assume_role_policy.json
  force_detach_policies = true
}

resource "aws_iam_role_policy" "aws_lb_controller_permissions" {
  name   = "aws-lb-controller-permissions"
  role   = aws_iam_role.aws_lb_controller.id
  policy = file("${path.module}/policies/aws-load-balancer-controller.json")
}
