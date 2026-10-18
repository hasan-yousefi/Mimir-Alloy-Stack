{{ define "mattermost.message" }}
{{ range .Alerts }}
{{ if eq .Status "firing" }}
🔥 Status: **FIRING**
**Started At:** {{ .StartsAt | tz "Asia/Tehran" | date "2006-01-02 15:04:05" }}
**Reason:** {{ .Annotations.summary }}
**Detail:** {{.Annotations.description }}
{{ else }}
✅ Status: **RESOLVED**
**Resolved At:** {{ .EndsAt | tz "Asia/Tehran" | date "2006-01-02 15:04:05" }}
**Started At:** {{ .StartsAt | tz "Asia/Tehran" | date "2006-01-02 15:04:05" }}
**Reason:** {{ .Annotations.summary }}
**Detail:** {{.Annotations.description }}
{{ end }}

---
{{ end }}
**Host:** {{ .CommonLabels.instance }}
**Severity:** {{ .CommonLabels.severity }}
{{ if .CommonLabels.name }}**Name:** {{ .CommonLabels.name }}{{ "\n" }}{{ end -}}
{{ if .CommonLabels.type }}**Environment:** {{ .CommonLabels.type }}{{ "\n" }}{{ end -}}
{{ if .CommonLabels.pod }}**Target Pod:** {{ .CommonLabels.pod }}{{ "\n" }}{{ end -}}
{{ if .CommonLabels.container }}**container:** {{ .CommonLabels.container }}{{ "\n" }}{{ end -}}
{{ if .CommonLabels.namespace }}**Namespace:** {{ .CommonLabels.namespace }}{{ "\n" }}{{ end -}}
{{ end }}