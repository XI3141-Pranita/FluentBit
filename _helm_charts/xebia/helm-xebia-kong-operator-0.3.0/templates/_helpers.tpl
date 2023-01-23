{{/* vim: set filetype=mustache: */}}
{{/*
namespace
*/}}
{{- define "kong.namespace" -}}
{{- default .Release.Namespace .Values.kong.namespace | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
kong deployment name
*/}}
{{- define "kong.name" -}}
{{- if .Values.kong.metadata }}
{{- .Values.kong.metadata.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- default .Release.Namespace | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}


{{/*
Expand the name of the chart.
*/}}
{{- define "kong-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kong-operator.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kong-operator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kong-operator.labels" -}}
helm.sh/chart: {{ include "kong-operator.chart" . }}
{{ include "kong-operator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kong-operator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kong-operator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "kong-operator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "kong-operator.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Prepare namespaces for Authorization Policy
*/}}
{{- define "istio.authorizationPolicyNs" }}
{{- if eq (len .Values.istio.authorizationPolicy.allowedNamespaces) 0}}
{{- toYaml (list .Values.namespace) }}
{{- else }}
{{- toYaml .Values.istio.authorizationPolicy.allowedNamespaces }}
{{- end }}
{{- end }}

