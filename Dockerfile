# Use lightweight Alpine
FROM alpine:3.21

RUN apk add --no-cache openjdk21-jre openjdk21 eudev udev-init-scripts

# Set working directory
WORKDIR /mcserver

# Expose Minecraft port
EXPOSE 25565

# Accept EULA automatically
RUN echo "eula=true" > eula.txt

# Default Java options (can be overridden)
ENV JAVA_OPTS="-Xmx8G -Xms512M"
ENV SERVER_JAR="server.jar"

# Start command (allow overriding CMD args)
ENTRYPOINT java $JAVA_OPTS -jar $SERVER_JAR

