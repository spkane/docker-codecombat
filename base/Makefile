# Project: docker codecombat base image
# Author: Sébastien Moratinos <codecombat@sebastien-moratinos.com>
# Date: 2014
# usage:
#	make build	- build new image from Dockerfile
#	make debug	- run already created image by tag


NAME=smoratinos/codecombat_base
VERSION=0.1
SSH_PORT=23


build:
	docker build -t $(NAME):$(VERSION) .

run:
	docker run -p $(SSH_PORT):22 -t -i $(NAME):$(VERSION)

debug: build
	docker run -p $(SSH_PORT):22 -t -i $(NAME):$(VERSION) /bin/bash

tag:
	git tag -d $(VERSION) 2>&1 > /dev/null
	git tag -d latest 2>&1 > /dev/null
	git tag $(VERSION)
	git tag latest

ssh:
	@ID=$$(docker ps | grep -F "$(NAME):$(VERSION)" | awk '{ print $$1 }') && \
		if test "$$ID" = ""; then echo "Container is not running."; exit 1; fi && \
		IP=$$(docker inspect $$ID | grep IPAddr | sed 's/.*: "//; s/".*//') && \
		echo "SSHing into $$IP" && \
		ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@$$IP -p $(SSH_PORT)

.PHONY: build run debug ssh tag
