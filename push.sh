#! /bin/bash

set -e

source ./variables.sh

repo_name=${container_repo}/${container_name}
tag=${repo_name}:${version}
latest_tag=${repo_name}:latest

docker push ${tag} && \
docker push ${latest_tag}