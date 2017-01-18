#!/bin/bash

command="go "$@

docker run --rm -e GOPATH=/go -w /go/src/app -v "$PWD":/go/src/app minixxie/golang:1.7 bash -c "$command"
