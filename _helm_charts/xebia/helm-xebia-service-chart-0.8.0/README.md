# helm-xebia-service-chart

Helm Chart for deploying microservices


## Chart Update Guidelines
* version in the `Chart.yaml` should be incremented every time there is any new changes to the chart template
* appVersion needs to be overwritten when deploying chart

## To try out chart with values.yaml you need to update the targetPort and containerPort to 80 as nginx docker image is exposed on port 80

## Configuration

Parameter | Description | Default | Required
--- | --- | --- | ---
`project` | project name | `project-name` | no (yes, if other project)
`fullnameOverride` | override the name of the release | `{{.Release.Name}}-app` | yes
`environment` | k8s environment in which the release is deployed dev/uat/prod | `dev` | yes
`namespace` | Namespace where all the template resources should be deployed | `test` | yes
`deployment.component` | The component within the architecture (database, server, api, library) | `api` | no
`deployment.containerPort` | port on which container is exposed {} | `http: 8080` | no
`deployment.imagePullSecrets` | image pull secrets | [] | no
`deployment.replicaCount` | Number of replicas | 2 | no
`deployment.image.registry` | docker image registry | `` | no
`deployment.image.repository` | docker image repo/image_name | `nginx` | yes
`deployment.image.pullPolicy` | docker image pull policy  | IfNotPresent | no
`deployment.image.tag` | docker image tag | `latest` | yes
`deployment.annotations` | Annotations for the deployment | {} | no
`deployment.nodeSelector` | restrict deployment to a specific node  | {} | no
`deployment.tolerations` | Tolerations to add against tainted nodes | [] | no
`deployment.podAnnotations` | Annotations for the pod | {} | no
`deployment.podSecurityContext` | privilege and access control settings for a Pod | {} | no
`deployment.securityContext` | privilege and access control settings for Container | `privileged: false` | no
`deployment.resources` | resources requests needed for a pod |     ```requests: cpu: 50m,memory: 300Mi``` | yes
`deployment.affinity` | constrain pods to nodes with particular labels | {} | no
`deployment.startupProbe` | liveness probe on the pod | {} | no
`deployment.livenessProbe` | liveness probe on the pod | {} | yes
`deployment.readinessProbe` | readiness probe on the pod | {} | yes
`deployment.extraEnvs` | environment variables | [] | no
`deployment.volumeMounts` | volumeMounts for the attached volumes | [] | no
`deployment.volumes` | volumes | [] | no
`service.type` | service exposing a deployment | `ClusterIP` | no
`service.annotations` | annotations to the service | {} | no
`service.ports` | list of map includes port exposed by service and on which pod listens |  ```name: http port: 8080 targetPort: 8080``` | no
`istio.enabled` | Enable istio configuration for the servive  | false | no
`istio.virtualService.enabled` | Istio Virtual Service for microservice  | false | no
`istio.virtualService.timeout` | Timeout for the Virtual Service | 1m | no
`istio.virtualService.host` | Virtual Service host | '*' | no
`istio.gateway.enabled` | Istio Gateway enabled for the service | false | no
`istio.gateway.portName` | Istio Gateway port name | http | no
`istio.gateway.portNumber` | Istio Gateway port number | 80 | no
`istio.gateway.protocol` | Istio Gateway protocol | HTTP | no
`istio.gateway.ingressHost` | Istio Gateway ingress host | '*' | no
`istio.authorizationPolicy.enabled`| isitio authorization policy to restrict service access  | false | no
`istio.authorizationPolicy.allowedNamespaces`| namespaces to allow inbound traffic from  | [`<namespace>`] | no
`autoscaling.enabled`| deploys Horizontal Pod Autoscaler | "" | no
`autoscaling.minReplicas`| min pod replicas | 2 | no
`autoscaling.maxReplicas`|max pod replicas | 10 | no
`autoscaling.targetCPUUtilizationPercentage`| CPU Utilization threshold % | 80 | no
`autoscaling.targetMemoryUtilizationPercentage`| Memory Utilization threshold % | "" | no
`serviceAccount.name    `| service account name | if {{.fullnameoverride}} then use this else {{.ReleaseName}}-app. if empty then `default` | no
`serviceAccount.annotations `| annotation for sa | {} | no
`config`| creates config map    | {} | no
`serviceMonitor.enabled`| create service monitor for prometheus to export metrics from the microserivce | false | no
`serviceMonitor.path`| uri/path on which prometheus metrics are available | /actuator/prometheus | no
`serviceMonitor.port`| service port name on which prometheus metrics are available | http | no
`secretProviderClass.enabled`| create Secret Provider Class for the application | false | no
`secretProviderClass.provider`| Secret Provider Class provider(aws/azure/gcp/vault) | aws | no
`secretProviderClass.objects`| List of secret objects whic will be accessed by the deployment | aws | no
`test`| deploys a test pod for service validation | false | no
