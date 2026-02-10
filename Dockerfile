FROM ghcr.io/lavalink-devs/lavalink:4.0.0

# Create app directory
WORKDIR /opt/Lavalink

# Copy configuration
COPY application.yml ./application.yml

# Expose Lavalink port
EXPOSE 2333

# Start Lavalink
CMD ["java", "-jar", "Lavalink.jar"]
