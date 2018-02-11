CONTAINER_NAME=openvpn-client

build: Dockerfile
	docker build -t olivermichel/openvpn-client .

run: build
	docker run --name ${CONTAINER_NAME} openvpn-client --cap-add=NET_ADMIN \
		--volume $(PWD)/data:/root/config olivermichel/openvpn-client

interactive: build
	docker run --name ${CONTAINER_NAME} --interactive --tty --cap-add=NET_ADMIN \
		--volume $(PWD)/data:/root/config olivermichel/openvpn-client /bin/sh

.PHONY: build run interactive
