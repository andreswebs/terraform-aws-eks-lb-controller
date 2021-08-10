variable "cluster_oidc_provider" {
  type        = string
  description = "OpenID Connect (OIDC) Identity Provider associated with the Kubernetes cluster"
}

variable "k8s_namespace" {
  type        = string
  description = "Kubernetes namespace"
  default     = "kube-system"
}

variable "k8s_sa_name" {
  type        = string
  description = "Kubernetes service account name"
  default     = "aws-load-balancer-controller"
}

variable "iam_role_name" {
  type        = string
  description = "IAM role name"
  default     = "aws-load-balancer-controller"
}
