#!/bin/bash
DOCKER_IMAGE=$1

dockerid=$(docker ps | grep ${DOCKER_IMAGE} | awk {'print $1'})

while [ 1 ]; do
      docker cp "${dockerid}:/root/image.png" ./screenshot.png
      sleep 1
done