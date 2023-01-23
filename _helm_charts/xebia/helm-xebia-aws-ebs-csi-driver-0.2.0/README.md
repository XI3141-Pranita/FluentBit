# helm-xebia-aws-ebs-csi-driver
Helm chart to provision AWS EBS CSI Driver

* Reference [helm chart - v1.2.0](https://github.com/kubernetes-sigs/aws-ebs-csi-driver/tree/v1.2.0)

* Note: The service account needs to have an annotation for the IAM role [IRSA](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html).



<br>

| Parameter                                   | Description                                                                                              | Default                                                                            |
| ------------------------------------------- | -------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `aws-ebs-csi-driver.controller.resources`                               | Controller pod resource requests & limits                                                                                  |       requests:cpu: 100m;memory:128Mi                                                                               |
`aws-ebs-csi-driver.controller.region`                               | AWS Region                                                                                |       ap-south-1
| `serviceAccount.annotations`                | optional annotations to add to service account                                                           | None                                                                               |
| `serviceAccount.create`                     | If `true`, create a new service account                                                                  | `false`                                                                             |
| `serviceAccount.name`                       | Service account to be used                                                                               |                                               ebs-csi-controller-sa                                   |
`node.serviceAccount.annotations`                | optional annotations to add to service account                                                           | None                                                                               |
| `node.serviceAccount.create`                     | If `true`, create a new service account                                                                  | `false`                                                                             |
| `node.serviceAccount.name`                       | Service account to be used                                                                               |                                               ebs-csi-node-sa                                |
| `storageClasses`                              | Storage Classes                                                                             | {}                                                                                |
| `AWS_STS_REGIONAL_ENDPOINTS`                    | It should be `regional` for private eks cluster.          | legacy
