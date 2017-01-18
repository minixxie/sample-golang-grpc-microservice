FROM minixxie/golang:1.7

ADD . /go/src/app
RUN echo "GOPATH=$GOPATH"
RUN cd /go/src/app && govendor sync
RUN cd /go/src/app && mkdir -p ./vendor/pb && protoc --proto_path=protos --go_out=plugins=grpc:vendor/pb `find protos -name "*.proto"`
RUN cd /go/src/app && go build -o main main.go && rm -rf *.* .git protos Dockerfile LICENSE README.md Godeps vendor

WORKDIR /go/src/app
ENV VIRTUAL_HOST sample-golang-grpc-microservice.test.com
EXPOSE 80
ENTRYPOINT ["/go/src/app/main"]
