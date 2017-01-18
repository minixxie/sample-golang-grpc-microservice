#!/bin/bash

command="govendor "$@

docker run --rm -w /go/src/app -v "$PWD":/go/src/app minixxie/golang:1.7 bash -c "$command"
