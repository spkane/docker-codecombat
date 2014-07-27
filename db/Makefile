# Project: docker codecombat db image
# Author: Sébastien Moratinos <codecombat@sebastien-moratinos.com>
# Date: 2014
# usage:
#	make build	- build new image from Dockerfile
#	make debug	- debug run already created image by tag
#	make try	- build and run in debug mode


NAME=smoratinos/codecombat-db
VERSION=latest
CONTAINER_NAME=codecombat-db
SSH_PORT=23
DB_PORT=27017
DATA_DIR="/data/db/coco/"


build:
	docker build -t $(NAME):$(VERSION) .

run:
	mkdir -p $(DATA_DIR)
	docker run --rm --name $(CONTAINER_NAME) -p $(DB_PORT):27017 -p $(SSH_PORT):22 -v $(DATA_DIR):/data/db -t -i $(NAME):$(VERSION)

debug:
	mkdir -p $(DATA_DIR)
	docker run --rm --name $(CONTAINER_NAME) -p $(DB_PORT):27017 -p $(SSH_PORT):22 -v $(DATA_DIR):/data/db -t -i $(NAME):$(VERSION) /bin/bash

restore:
	mkdir -p $(DATA_DIR)
	docker run --rm --name $(CONTAINER_NAME) -p $(DB_PORT):27017 -p $(SSH_PORT):22 -v $(DATA_DIR):/data/db -t -i $(NAME):$(VERSION) /bin/bash /root/restore.sh

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

.PHONY: build run restore ssh tag debug