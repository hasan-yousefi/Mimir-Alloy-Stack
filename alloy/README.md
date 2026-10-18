# Grafana Alloy Helm chart:

![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![Version: 1.11.1](https://img.shields.io/badge/Version-1.11.1-informational?style=flat-square) ![AppVersion: v1.18.1](https://img.shields.io/badge/AppVersion-v1.18.1-informational?style=flat-square)

Helm chart for deploying [Grafana Alloy][] to Kubernetes.

[Grafana Alloy]: https://grafana.com/docs/alloy/latest/

## Install
```
helm install alloy alloy/ --version 1.11.1
```

## Define New Team
1. Our structure like: 
      - Each team has own directory
        ![image info](pictures/team-structs.png)
2. Change the helm values:
      - Define new **volumemount** and **configmap**
        ![image info](pictures/alloy-configs.png)
        ![image info](pictures/alloy-configs2.png)
      - Create new configmap under Templates directory
        ![image info](pictures/alloy-configs3.png)
3. Defining new team must follow some steps:
      - Define Exporter You Need:
        ![image info](pictures/exporter1.png)
      - Define Pipeline That Route Our Targets To **Mimir** And Some Filter(Optional):
        ![image info](pictures/exporter2.png)

4.  Defining **alert** for specific team checks [alert](../team-alerts/):

> [!warning]
> Reloading configuration by **curl -X POST http://<alloy-address>:12345/-/reload**
## Contact
Hassan Yousefi - [hsn.yousefi158@@gmail.com]

## license
Apache License 2.0