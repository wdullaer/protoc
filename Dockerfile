FROM golang:alpine

# Install required additional tooling
RUN apk --no-cache add git protobuf make protobuf-dev
RUN apk --no-cache add openssh
RUN apk --no-cache add bash zip

CMD /bin/bash

# Install grpc
RUN go get -u google.golang.org/grpc

# Install protoc go plugin
RUN go get -u github.com/golang/protobuf/protoc-gen-go

# Install protoc-gen-validate
RUN go get -d github.com/envoyproxy/protoc-gen-validate &&\
    cd $GOPATH/src/github.com/envoyproxy/protoc-gen-validate &&\
    make build

