/**
* Deploys the Helm chart for the AWS Load Balancer Controller
*
* Note: The chart depends on an imperative deployment of CRDs:
*
* ```sh
* kubectl apply -k "https://github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"
* ```
*/

terraform {
  required_version = ">= 1.0.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.48.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.2.0"
    }

  }
}

resource "helm_release" "aws_lb_controller" {
  name       = var.helm_release_name
  namespace  = var.k8s_namespace
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = var.chart_version_aws_lb_controller

  recreate_pods     = var.helm_recreate_pods
  atomic            = var.helm_atomic_creation
  cleanup_on_fail   = var.helm_cleanup_on_fail
  wait              = var.helm_wait_for_completion
  wait_for_jobs     = var.helm_wait_for_jobs
  timeout           = var.helm_timeout_seconds
  max_history       = var.helm_max_history
  verify            = var.helm_verify
  keyring           = var.helm_keyring
  reuse_values      = var.helm_reuse_values
  reset_values      = var.helm_reset_values
  force_update      = var.helm_force_update
  replace           = var.helm_replace
  create_namespace  = var.helm_create_namespace
  dependency_update = var.helm_dependency_update
  skip_crds         = var.helm_skip_crds

  values = [
    templatefile("${path.module}/helm-values/aws-lb-controller.yml.tpl", {
      iam_role_arn = var.iam_role_arn
      k8s_sa_name  = var.k8s_sa_name
      cluster_name = var.cluster_name
    })
  ]

}
