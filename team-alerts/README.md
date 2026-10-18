## Mimir Alerting
1. Download mimirtool
      - curl -fLo mimir https://github.com/grafana/mimir/releases/latest/download/mimirtool-linux-amd64
2. Load new configuration: 
      - mimir alertmanager load team1/config_alert.yaml team1/mattermost.tpl --address http://mimir.example.com --id team1
3. Get list all configurations 
      - mimir alertmanager get --address http://mimir.example.com --id team1
4. Load our rules for specific tenant
      - mimir rules load my-alerts.yaml --address http://mimir.example.com --id team1
5. How check status Pending|Firing|Inactive for specific alerts
      - curl -s -H "X-Scope-OrgID: team1"   "http://mimir.example.com/prometheus/api/v1/rules" | jq '.data.groups[].rules[] | {name: .name, state: .state, activeAlerts: .alerts}'
6. Get list all alerts
      - mimirtool rules list --address http://mimir.example.com --id team1

## Alloy Alerting
1. Define rules like below and put on alloy configuration
```
mimir.rules.kubernetes "team1_rules" {
  address   = "http://mimir.example.com"

  tenant_id = "team1"

  sync_interval = "5m"

  rule_selector {
    match_labels = {
      "tenant" = "team1",
    }
  }
}
```
2.  Define Alerts with specific labels
```
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: team1-elasticsearch-alerts
  namespace: monitoring
  labels:
    tenant: "team1"
spec:
  groups:
    - name: elasticsearch.rules
      rules:
        - alert: ElasticsearchNodeDown
          expr: elasticsearch_process_cpu_seconds_total == 0
          for: 2m
          labels:
            severity: critical
          annotations:
            summary: "Elasticsearch node stopped emitting metrics"
            description: "Target {{ $labels.instance }} is currently down." 
```

## Contact
Hassan Yousefi - [hsn.yousefi158@@gmail.com]

## license
Apache License 2.0