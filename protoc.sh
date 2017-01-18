#!/bin/bash

docker run --rm -w /go/src/app -v "$PWD":/go/src/app minixxie/golang:1.7 bash -c 'mkdir -p ./vendor/pb && protoc --proto_path=protos --go_out=plugins=grpc:vendor/pb `find protos -name "*.proto"`'
