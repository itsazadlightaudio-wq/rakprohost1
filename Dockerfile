# ================================
# Lavalink Server - SIMPLE VERSION
# ================================
FROM ghcr.io/lavalink-devs/lavalink:4.0.0

# Set working directory
WORKDIR /opt/Lavalink

# Copy configuration file
COPY application.yml ./application.yml

# Set environment variables
ENV LAVALINK_SERVER_PASSWORD="Rak@1#32178&6"
ENV _JAVA_OPTIONS="-Xmx2G"
ENV SERVER_PORT=2333
ENV SERVER_ADDRESS=0.0.0.0

# Expose port
EXPOSE 2333

# Create a simple health check script
RUN echo '#!/bin/sh' > /healthcheck.sh && \
    echo 'wget -q --spider http://localhost:2333/version || exit 1' >> /healthcheck.sh && \
    chmod +x /healthcheck.sh

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD /healthcheck.sh

# Start Lavalink server
CMD ["java", "-jar", "Lavalink.jar"]
