#!/bin/bash

docker stop $(docker ps -q)
docker rm $(docker ps -aq)
docker build -t cross-compile .
docker rmi $(docker images -f "dangling=true" -q)