# helm-xebia-kube-prometheus-stack

Helm Chart to deploy Monitoring stack (Prometheus, Grafana, Alert Manager)

[kube-prometheus-stack Reference](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)

[Prometheus Reference](https://operatorhub.io/operator/prometheus)

## Installing 
'''sh
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    helm repo update
    helm upgrade kube-prometheus-stack --version $CHART_VERSION -f values --install --atomic
'''

## Configurations for EKS as control plane is not accessible
'''yaml
kubeControllerManager:
  enabled: false
kubeScheduler:
  enabled: false
kubeProxy:
  enabled: false
'''

## Grafana

Create a secret called `grafana-auth` with username and password

## Below command is mendatory before deploying the monitoring stack.
helm dep build 