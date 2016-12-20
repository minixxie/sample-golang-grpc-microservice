FROM minixxie/golang:1.7

RUN apt-get update && apt-get -q -y install unzip
RUN cd /tmp/ && wget https://github.com/google/protobuf/releases/download/v3.0.0/protoc-3.0.0-linux-x86_64.zip && cd /usr && unzip -o /tmp/protoc-3.0.0-linux-x86_64.zip
RUN apt-get -q -y remove unzip
RUN apt-get clean

ADD . /usr/src/myapp
RUN cd /usr/src/myapp && mkdir -p ./pb && protoc --proto_path=protos --go_out=pb `find protos -name "*.proto"`
RUN cd /usr/src/myapp && go build -o main main.go && rm -rf *.* .git Dockerfile LICENSE

WORKDIR /usr/src/myapp
ENV VIRTUAL_HOST sample-golang-grpc-microservice.test.com
EXPOSE 80
ENTRYPOINT ["/usr/src/myapp/main"]
