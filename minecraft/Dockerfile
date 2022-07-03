FROM azul/zulu-openjdk-alpine:17

COPY fabric-server-launch.jar /srv/minecraft/fabric-server-launch.jar

WORKDIR /srv/minecraft

ENTRYPOINT ["/bin/sh","-c","/usr/bin/java -Xms$MCRAM -Xmx$RAM -javaagent:/srv/minecraft/authlib-injector-1.1.46.jar=https://littlesk.in/api/yggdrasil -jar fabric-server-launch.jar nogui"]