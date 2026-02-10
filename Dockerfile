FROM ghcr.io/lavalink-devs/lavalink:4.0.0

WORKDIR /opt/Lavalink

COPY application.yml ./

EXPOSE 2333

CMD ["java", "-jar", "Lavalink.jar"]
