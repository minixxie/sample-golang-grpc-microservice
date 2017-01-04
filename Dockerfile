FROM minixxie/golang:1.7

ADD . /usr/src/myapp
RUN cd /usr/src/myapp && godep restore
RUN cd /usr/src/myapp && mkdir -p ./pb && protoc --proto_path=protos --go_out=pb `find protos -name "*.proto"`
RUN cd /usr/src/myapp && go build -o main main.go && rm -rf *.* .git protos Dockerfile LICENSE README.md Godeps

WORKDIR /usr/src/myapp
ENV VIRTUAL_HOST sample-golang-grpc-microservice.test.com
EXPOSE 80
ENTRYPOINT ["/usr/src/myapp/main"]
