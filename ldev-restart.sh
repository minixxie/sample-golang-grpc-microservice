#!/bin/bash

docker rm -f sample-golang-grpc-microservice
docker-compose -f ldev-docker-compose.yml up -d
MONGO_URI=$MONGO_URI docker logs -f sample-golang-grpc-microservice
