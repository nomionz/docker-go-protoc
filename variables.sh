#!/bin/bash -e

while [[ $# -gt 0 ]]; do
  case "$1" in
    --container-repo=*)
      container_repo="${1#*=}"
      ;;
    --container-name=*)
      container_name="${1#*=}"
      ;;
    --go-version=*)
      go_version="${1#*=}"
      ;;
    --protoc-version=*)
      protoc_version="${1#*=}"
      ;;
    --protoc-gen-go-version=*)
      protoc_gen_go_version="${1#*=}"
      ;;
    --protoc-gen-go-grpc-version=*)
      protoc_gen_go_grpc_version="${1#*=}"
      ;;
    --debian-version=*)
      debian_version="${1#*=}"
      ;;
    --platform=*)
      platform="${1#*=}"
      ;;
    --version=*)
      version="${1#*=}"
      ;;
    *)
      echo "invalid option: $1"
      exit 1
      ;;
  esac
  shift
done

container_repo="${container_repo:-nomionz}"
container_name="${container_name:-go-protoc}"
go_version="${go_version:-1.21.3}"
protoc_version="${protoc_version:-24.4}"
protoc_gen_go_version="${protoc_gen_go_version:-1.31}"
protoc_gen_go_grpc_version="${protoc_gen_go_grpc_version:-1.3}"
debian_version="${debian_version:-bullseye}"
platform="${platform:-x86_64}"
version="${version:-${protoc_gen_go_version}}"
