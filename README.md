# AutoDeploy-自动部署/启动服务器监控

## 依赖安装：

`docker-loki-driver-plugin`
```shell
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions # x64

docker plugin install grafana/loki-docker-driver:arm-v7 --alias loki --grant-all-permissions # arm
```