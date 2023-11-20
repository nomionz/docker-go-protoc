## Dockerized golang grpc plugin

It's used for generating proto code from proto definition.

## Motivation

I don't want to install protoc and grpc plugin on my local machine with gcc and other dependencies on my local machine.

Why not use docker?

## Usage

Checkout the [docker hub](https://hub.docker.com/repository/docker/nomionz/go-protoc/tags?page=1&ordering=last_updated) to know what tags apart of `lates` are available.

```bash
docker run -it --rm -v .:/defs nomionz/go-protoc:latest bash -c "<protoc command>"
```
