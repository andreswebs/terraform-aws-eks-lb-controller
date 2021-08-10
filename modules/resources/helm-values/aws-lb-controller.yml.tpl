---
clusterName: ${cluster_name}

serviceAccount:
  create: true
  annotations:
    eks.amazonaws.com/role-arn: ${iam_role_arn}
  name: ${k8s_sa_name}
