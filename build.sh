#!/bin/bash
set -e

echo
echo "Building mc server docker image!"
image="mc_server:latest"
docker build . -t $image

echo
echo "Build done! Added image $image"
echo
echo "WARNING: server runs with a default java VM arg max of 8G. You can set the JAVA_OPTS env in your docker command if this is not okay"
echo "WARNING: the server will try to run using the 'server.jar' file. Make sure you rename your server file to 'server.jar', or specifiy the SERVER_JAR env var in your docker command"
