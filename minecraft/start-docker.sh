set -e

currentTime=`date "+%Y-%m-%d:%H-%M-%S"`

backupWorld(){
    rm -rf world.bak*
    cp -r -f world world.bak${currentTime}
}

backupWorld
docker rm --force mc-server
docker run \
    --network=mcserver \
    -p 25565:25565/tcp \
    -p 25575:25575/tcp \
    -v /root/mc-server/fb12.6/plugins:/srv/minecraft/plugins \
    -v /root/mc-server/fb12.6/versions:/srv/minecraft/versions \
    -v /root/mc-server/fb12.6/server.properties:/srv/minecraft/server.properties \
    -v /root/mc-server/fb12.6/world:/srv/minecraft/world \
    -v /root/mc-server/fb12.6/world_nether:/srv/minecraft/world_nether \
    -v /root/mc-server/fb12.6/world_the_end:/srv/minecraft/world_the_end \
    -v /root/mc-server/fb12.6/mods:/srv/minecraft/mods \
    -v /root/mc-server/fb12.6/logs:/srv/minecraft/logs \
    -v /root/mc-server/fb12.6/ops.json:/srv/minecraft/ops.json \
    -v /root/mc-server/fb12.6/usercache.json:/srv/minecraft/usercache.json \
    -v /root/mc-server/fb12.6/whitelist.json:/srv/minecraft/whitelist.json \
    -v /root/mc-server/fb12.6/server-icon.png:/srv/minecraft/server-icon.png \
    -v /root/mc-server/fb12.6/config:/srv/minecraft/config \
    --restart=always \
    --name "mc-server" \
    -e RAM=10G \
    -e MCRAM=9G \
    -d \
    kevinserver_new:latest 
