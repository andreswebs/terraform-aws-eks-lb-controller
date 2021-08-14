[//]: # (BEGIN_TF_DOCS)
Deploys IAM resources for the AWS Load Balancer Controller.

## Usage

Example:

```hcl
module "aws_lb_controller_iam" {
  source                = "github.com/andreswebs/terraform-aws-eks-lb-controller//modules/iam"
  cluster_oidc_provider = var.cluster_oidc_provider
  iam_role_name         = "eks-lb-controller-${var.eks_cluster_id}"
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_oidc_provider"></a> [cluster\_oidc\_provider](#input\_cluster\_oidc\_provider) | OpenID Connect (OIDC) Identity Provider associated with the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | IAM role name | `string` | `"aws-load-balancer-controller"` | no |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | Kubernetes namespace | `string` | `"kube-system"` | no |
| <a name="input_k8s_sa_name"></a> [k8s\_sa\_name](#input\_k8s\_sa\_name) | Kubernetes service account name | `string` | `"aws-load-balancer-controller"` | no |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_assume_role_policy"></a> [assume\_role\_policy](#module\_assume\_role\_policy) | andreswebs/eks-irsa-policy-document/aws | 1.0.0 |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role"></a> [role](#output\_role) | IAM role for the Kubernetes service account |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.48.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.48.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

[//]: # (END_TF_DOCS)cy) | resource |

[//]: # (END_TF_DOCS)
