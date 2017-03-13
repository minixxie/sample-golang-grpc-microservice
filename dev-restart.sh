#!/bin/bash

docker rm -f dev-sample-golang-grpc-microservice
docker-compose -f dev-docker-compose.yml up -d
docker logs -f dev-sample-golang-grpc-microservice
