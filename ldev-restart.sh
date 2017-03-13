#!/bin/bash

docker rm -f ldev-sample-golang-grpc-microservice
docker-compose -f ldev-docker-compose.yml up -d
docker logs -f ldev-sample-golang-grpc-microservice
