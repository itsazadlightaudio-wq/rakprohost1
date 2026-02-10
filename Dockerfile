# ================================
# Lavalink Server with All Plugins
# ================================
FROM ghcr.io/lavalink-devs/lavalink:4.0.0

# Install curl for health check
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /opt/Lavalink

# Copy configuration file
COPY application.yml ./application.yml

# Download all required plugins
RUN mkdir -p ./plugins && \
    curl -L -o ./plugins/youtube-plugin.jar \
        https://github.com/lavalink-devs/youtube-plugin/releases/download/v1.12.0/youtube-plugin-1.12.0.jar && \
    curl -L -o ./plugins/lavasrc-plugin.jar \
        https://github.com/topi314/LavaSrc/releases/download/v4.2.0/lavasrc-plugin-4.2.0.jar && \
    curl -L -o ./plugins/lavasearch-plugin.jar \
        https://github.com/topi314/LavaSearch/releases/download/v1.0.0/lavasearch-plugin-1.0.0.jar && \
    curl -L -o ./plugins/lavalyrics-plugin.jar \
        https://github.com/topi314/LavaLyrics/releases/download/v1.0.0/lavalyrics-plugin-1.0.0.jar && \
    curl -L -o ./plugins/sponsorblock-plugin.jar \
        https://github.com/topi314/SponsorBlock-Plugin/releases/download/v3.0.1/sponsorblock-plugin-3.0.1.jar && \
    curl -L -o ./plugins/skybot-plugin.jar \
        https://github.com/DuncteBot/skybot-lavalink-plugin/releases/download/v1.7.0/skybot-lavalink-plugin-1.7.0.jar && \
    curl -L -o ./plugins/lyrics-plugin.jar \
        https://github.com/Duncte123/java-lyrics-plugin/releases/download/1.6.5/java-lyrics-plugin-1.6.5.jar

# Set environment variables
ENV LAVALINK_SERVER_PASSWORD="Rak@1#32178&6"
ENV _JAVA_OPTIONS="-Xmx4G"
ENV JAVA_TOOL_OPTIONS="-Djava.security.egd=file:/dev/./urandom"

# Expose Lavalink port
EXPOSE 2333

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
    CMD curl -f http://localhost:2333/version || exit 1

# Start Lavalink server
CMD ["java", "-jar", "Lavalink.jar"]
