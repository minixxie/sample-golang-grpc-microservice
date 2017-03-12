#!/bin/bash

echo "govendor sync..."
cd /go/src/app && govendor sync
echo "protoc..."
cd /go/src/app && mkdir -p ./vendor/pb && protoc --proto_path=protos --go_out=plugins=grpc:vendor/pb `find protos -name "*.proto"`
echo "go run main.go"
go run main.go
