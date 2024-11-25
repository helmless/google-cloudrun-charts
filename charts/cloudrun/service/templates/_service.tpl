{{/*
Templates out the manifest for a CloudRun Service.
*/}}
{{- define "serverless-helm.cloudrun.service" -}}
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: {{ include "serverless-helm.cloudrun.name" . }}
  labels:
    {{- with .Values.labels }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
  annotations:
    {{- with .Values.annotations }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
    {{- with .Values.launchStage }}
    run.googleapis.com/launch-stage: {{ . }}
    {{- end }}
    {{- with .Values.description }}
    run.googleapis.com/description: {{ . }}
    {{- end }}
    {{- with .Values.ingress }}
    run.googleapis.com/ingress: {{ . }}
    {{- end }}
    run.googleapis.com/region: {{ .Values.region }}
spec:
  template:
    metadata:
      annotations:
        {{- with .Values.podAnnotations }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
        {{- with .Values.vpc }}
        {{- if and .connector (or .network .subnetwork) }}
        {{- fail "Cannot specify both VPC connector and direct VPC access (network/subnetwork)" }}
        {{- end }}
        {{- if and .network .subnetwork }}
        run.googleapis.com/network-interfaces: '[{"network":"{{ .network }}","subnetwork":"{{ .subnetwork }}"}]'
        {{- else if or .network .subnetwork }}
        {{- fail "VPC network and subnetwork must be specified together" }}
        {{- end }}
        {{- if .connector }}
        run.googleapis.com/vpc-access-connector: {{ .connector }}
        {{- end }}
        {{- if and (or .connector (and .network .subnetwork)) .egress }}
        run.googleapis.com/vpc-access-egress: {{ .egress }}
        {{- end }}
        {{- end }}

        {{- with .Values.cloudSql }}
        run.googleapis.com/cloudsql-instances: {{ .instances }}
        {{- end }}

        {{- if .Values.executionEnvironment }}
        run.googleapis.com/execution-environment: {{ .Values.executionEnvironment }}
        {{- end }}

        {{- with .Values.resources }}
        {{- if hasKey . "cpuThrottling" }}
        run.googleapis.com/cpu-throttling: {{ .cpuThrottling | quote }}
        {{- end }}
        {{- if .startupBoost }}
        run.googleapis.com/startup-cpu-boost: {{ .startupBoost | quote }}
        {{- end }}
        {{- end }}

        {{- with .Values.autoscaling }}
        {{- if .minScale }}
        autoscaling.knative.dev/minScale: {{ .minScale | quote }}
        {{- end }}
        {{- if .maxScale }}
        autoscaling.knative.dev/maxScale: {{ .maxScale | quote }}
        {{- end }}
        {{- end }}
        {{- with .Values.sessionAffinity }}
        run.googleapis.com/sessionAffinity: {{ . | quote }}
        {{- end }}
    spec:
      {{- if .Values.serviceAccountName }}
      serviceAccountName: {{ .Values.serviceAccountName }}
      {{- end }}

      {{- with .Values.autoscaling }}
      containerConcurrency: {{ .maxConcurrentRequests | default 80 }}
      {{- end }}
      {{- with .Values.timeoutSeconds }}
      timeoutSeconds: {{ . | default 300 }}
      {{- end }}

      containers:
        - image: {{ include "serverless-helm.cloudrun.image" . }}
          {{- with .Values.command }}
          command:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with .Values.args }}
          args:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- if .Values.env }}
          env: {{- include "serverless-helm.cloudrun.env" . | nindent 12 }}
          {{- end }}

          {{- with .Values.resources }}
          resources:
            {{- if .limits }}
            limits:
              {{- if .limits.cpu }}
              cpu: {{ .limits.cpu | quote }}
              {{- end }}
              {{- if .limits.memory }}
              memory: {{ .limits.memory | quote }}
              {{- end }}
            {{- end }}
          {{- end }}

          ports:
            - containerPort: {{ include "serverless-helm.cloudrun.containerPort" . }}

          {{- with .Values.volumeMounts }}
          volumeMounts:
            {{- toYaml . | nindent 12 }}
          {{- end }}

          {{- with .Values.livenessProbe }}
          livenessProbe:
            {{- toYaml . | nindent 12 }}
          {{- end }}

          {{- with .Values.readinessProbe }}
          readinessProbe:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          {{- with .Values.startupProbe }}
          startupProbe:
            {{- toYaml . | nindent 12 }}
          {{- end }}

      {{- with .Values.volumes }}
      volumes:
        {{- toYaml . | nindent 8 }}
      {{- end }}

  {{- with .Values.traffic }}
  traffic:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end -}}
