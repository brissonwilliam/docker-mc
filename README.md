# 🐋 docker-mc

docker-mc is a repo to help you setup your minecraft server in docker, which is usually safer than running bare-metal when configured properly.

**This is not a repo which builds and hosts docker images in docker hub. You have to manage your own minecraft server folder, mods and executables**

Containerisation of your minecraft server is useful for:
- auto restarts
- easy stopping and starting your server
- not having to use 'screen' or 'tmux' to hold the server in background process
- limiting hardware resources like RAM or CPU
- secure filesystem acces isolation
- secure network isolation
- every other cool thing that docker does better than running apps bare-metal as system services

### Running
1) Create the docker image
```
./build.sh
```
2) Run the docker image
   - Bind your minecraft server folder to /mcserver. **This is required. The container does not have a default minecraft server executable**
   - Edit the JAVA_OPTS env var to modify the default java VM args. By default, a maximum of 8GB of RAM is allowed
   - Edit the SERVER_JAR env var to your minecraft server jar. By default, the container tries to run the server from `server.jar`
   - Consider not listening to 0.0.0.0 (defaul docker behaviour when you bind ports), by having a TCP tunnel ip interface to listen on (like a wireguard vpn or tailscale vpn), or a reverse proxy like traefik where you can just expose the network port and not bind it to a host network interface.
   - Avoid using privileged mode and host network interface

   
### Docker compose example.
 ```
  services:   
    mc_server:
        restart: unless-stopped
        image: mc_server:latest
        container_name: mc_server
        networks:
          - mc_server
        ports:
          - 25565:25565
        environment:
          JAVA_OPTS: "-Xmx8G -Xms512M"
          SERVER_JAR: "fabric-server.jar"
        volumes:
          - {your_mc_server_path}:/mcserver/
  networks:
    mc_server:
      name: mc_server
 ```

   
