# Project: codecombat development environment with docker
# Author: Sébastien Moratinos <codecombat@sebastien-moratinos.com>
# Date: 2014
# usage:
#	make pull-docker   	- pull docker images
#	make restore-db 	- restore a db snapshot
#	make install-app 	- pull git repository and compile app
#	make test-app     	- run app tests
#	make run-app     	- run app with auto-refresh compile
#	make ssh-db     	- connect via ssh to db container
#	make ssh-web     	- connect via ssh to web container

DB_CONTAINER_NAME=smoratinos/codecombat-db
DB_SSH_PORT=23
WEB_CONTAINER_NAME=smoratinos/codecombat-web
WEB_SSH_PORT=24

pull-docker:
	docker pull $(DB_CONTAINER_NAME)
	docker pull $(WEB_CONTAINER_NAME)

restore-db:
	cd db && make restore

install-app:
	cd web && make install

test-app:
	echo "not yet implemented"

run-app:
	cd db && make run &
	sleep 30 && cd web && make run

ssh-db:
	@ID=$$(docker ps | grep -F "$(DB_CONTAINER_NAME)" | awk '{ print $$1 }') && \
		if test "$$ID" = ""; then echo "Container is not running."; exit 1; fi && \
		IP=$$(docker inspect $$ID | grep Gateway | sed 's/.*: "//; s/".*//') && \
		echo "SSHing into $$IP" && \
		ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@$$IP -p $(DB_SSH_PORT)

ssh-web:
	@ID=$$(docker ps | grep -F "$(WEB_CONTAINER_NAME)" | awk '{ print $$1 }') && \
		if test "$$ID" = ""; then echo "Container is not running."; exit 1; fi && \
		IP=$$(docker inspect $$ID | grep Gateway | sed 's/.*: "//; s/".*//') && \
		echo "SSHing into $$IP" && \
		ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@$$IP -p $(WEB_SSH_PORT)

.PHONY: pull-docker restore-db install-app test-app run-app ssh-db ssh-web