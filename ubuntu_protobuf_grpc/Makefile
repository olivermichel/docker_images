
build: Dockerfile
	docker build -t olivermichel/ubuntu_protobuf_grpc .

push: build
	docker push olivermichel/ubuntu_protobuf_grpc:latest

run: build
	docker run -it olivermichel/ubuntu_protobuf_grpc /bin/bash

.PHONY: build push run
