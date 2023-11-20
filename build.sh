#!/bin/bash
set -e

source ./variables.sh

tag=${container_name}:${version}

echo "building container with tag ${tag}"

docker build -t ${tag} \
    -f Dockerfile \
    --build-arg debian_version="${debian_version}" \
    --build-arg go_version="${go_version}" \
    --build-arg protoc_version="${protoc_version}" \
    --build-arg protoc_gen_go_version="${protoc_gen_go_version}" \
    --build-arg protoc_gen_go_grpc_version="${protoc_gen_go_grpc_version}" \
    --build-arg platform="${platform}" \
    .
