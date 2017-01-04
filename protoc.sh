#!/bin/bash

docker run --rm -w /usr/src/myapp -v "$PWD":/usr/src/myapp minixxie/golang:1.7 bash -c 'mkdir -p ./pb && protoc --proto_path=protos --go_out=pb `find protos -name "*.proto"`'
