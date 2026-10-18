# kubernetes

## Mimir Monitoring Stack
This repository sets up a scalable observability pipeline using two core Grafana components:

* **[Alloy](./alloy/):** The telemetry collector agent (running on your nodes or clusters). It scrapes metrics from your applications and infrastructure and efficiently forwards them to Mimir.
* **[mimir](./mimir/):** The scalable backend time-series database. It receives the metrics from Alloy, stores them securely with native multi-tenancy, and powers long-term storage, querying (PromQL), and alerting.
### Key Features
* **High Availability (HA) Mode:** Distributed deployment across multiple replicas ensures zero-downtime operation, automatic failover, and high query durability.
* **Multi-Tenancy:** Native data isolation per team/tenant using request headers (`X-Scope-OrgID`).
* **External S3 Storage:** Offloads long-term block data to S3-compatible object storage (e.g., AWS S3, MinIO) for cost-efficient, resilient storage.

## Getting started
```
cd existing_repo
git remote add origin https://github.com/hasan-yousefi/Mimir-Alloy-Stack.git
git branch -M main
git push -uf origin main
```
## Requirments
1. calico
2. Api-gateway
3. Metalb
    - **Beacuse on-perm environment we need to define metallb to assigned External-ip for services that use service type: Loabalancer**
4. Istio
    - **Our gatewayclass requirment istio to handle traffic**

## Contact
Hassan Yousefi - [hsn.yousefi158@@gmail.com]

## License
Apache License 2.0