
TAG=protobuf-grpc-alpine

build: Dockerfile
	docker build -t $(TAG) .

push: build
	docker push $(TAG):latest

run: build
	docker run -it $(TAG) /bin/sh

.PHONY: build push run
