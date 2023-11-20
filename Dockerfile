ARG debian_version
ARG go_version
ARG protoc_version
ARG protoc_gen_go_version
ARG protoc_gen_go_grpc_version
ARG platform

FROM golang:$go_version-$debian_version AS build

WORKDIR /defs

ARG protoc_version
ARG protoc_gen_go_version
ARG protoc_gen_go_grpc_version
ARG platform
 
RUN apt-get update && apt-get install -y --no-install-recommends unzip

ENV arch=x86_64
  
RUN if [ ${platform} = "arm64" ]; then export arch=aarch_64; fi

RUN wget --quiet https://github.com/protocolbuffers/protobuf/releases/download/v${protoc_version}/protoc-${protoc_version}-linux-${arch}.zip && \
    unzip -o protoc-${protoc_version}-linux-${arch}.zip -d /usr/local bin/protoc && \
    unzip -o protoc-${protoc_version}-linux-${arch}.zip -d /usr/local 'include/*' && \
    rm -f protoc-${protoc_version}-linux-${arch}.zip
    
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v${protoc_gen_go_version} && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v${protoc_gen_go_grpc_version}
