# Project: docker codecombat web image
# Author: Sébastien Moratinos <codecombat@sebastien-moratinos.com>
# Date: 2014
# usage:
#	make build	- build new image from Dockerfile
#	make debug	- debug run already created image by tag
#	make try	- build and run in debug mode


NAME=smoratinos/codecombat-web
VERSION=0.1
CONTAINER_NAME=codecombat-web
DB_CONTAINER_NAME=codecombat-db
SSH_PORT=24
WEB_PORT=3000
APP_DIR="/data/app/coco/"


build:
	docker build -t $(NAME):$(VERSION) .

run:
	mkdir -p $(APP_DIR) && docker run --rm --link $(DB_CONTAINER_NAME):dbhost --name $(CONTAINER_NAME) -p $(WEB_PORT):3000 -p $(SSH_PORT):22 -v $(APP_DIR):/opt/codecombat/ -t -i $(NAME):$(VERSION)

debug:
	mkdir -p $(APP_DIR) && docker run --rm --link $(DB_CONTAINER_NAME):dbhost --name $(CONTAINER_NAME) -p $(WEB_PORT):3000 -p $(SSH_PORT):22 -v $(APP_DIR):/opt/codecombat/ -t -i $(NAME):$(VERSION) /bin/bash

install:
	mkdir -p $(APP_DIR) && docker run --rm --name $(CONTAINER_NAME) -p $(WEB_PORT):3000 -p $(SSH_PORT):22 -v $(APP_DIR):/opt/codecombat/ -t -i $(NAME):$(VERSION) /bin/bash /root/install.sh

tag:
	git tag -d $(VERSION) 2>&1 > /dev/null
	git tag -d latest 2>&1 > /dev/null
	git tag $(VERSION)
	git tag latest

ssh:
	@ID=$$(docker ps | grep -F "$(NAME):$(VERSION)" | awk '{ print $$1 }') && \
		if test "$$ID" = ""; then echo "Container is not running."; exit 1; fi && \
		IP=$$(docker inspect $$ID | grep Gateway | sed 's/.*: "//; s/".*//') && \
		echo "SSHing into $$IP" && \
		ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@$$IP -p $(SSH_PORT)

.PHONY: build run install ssh tag debug