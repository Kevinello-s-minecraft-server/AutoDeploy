docker run --rm --network=mcserver \
           --name=mcserver_exporter \
           -v /root/mc-server/fb12.6/world:/minecraft/world \
           -p 8005:8000 \
           ghcr.io/dirien/minecraft-exporter:latest \
           --web.listen-address=":8000" \
           --mc.world="/minecraft/world" \
           --mc.rcon-address="mc-server:25575" \
           --mc.rcon-password="kevinmatt" \
           --mc.mod-server-stats=fabric \
           --mc.name-source="offline"

docker rm mcserver_grafana --force
docker run --network=mcserver \
           -d --name=mcserver_grafana \
           -p 3001:3000 grafana/grafana-enterprise

docker rm mcserver_prometheus --force
docker run --network=mcserver -d -p 9091:9090 \
           -v /opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
           --name=mcserver_prometheus \
           prom/prometheus