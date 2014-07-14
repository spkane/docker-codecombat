codecombat docker dev setup
=================

Introduction
--------------

CodeCombat Development environment setup.

If you don't know Docker, you should prefer use [official dev env setup] (https://github.com/codecombat/codecombat/wiki/Developer-environment)

[CodeCombat] (http://codecombat.com) is a multiplayer live coding strategy game. Learn how to code by playing a game !

You must use a codecombat-db container to store data in the db.
And you must use a codecombat-web container to serve the source files and expose a nodejs web server. 

Dependencies
--------------

### Docker

Linux Users : Install docker

Windows and Mac Users : Install a Linux in Vagrant and install Docker in your Virtual Machine


Base image
--------------

Simple "ubuntu:14.04" image.

Use supervisord to manage multiple process.

Install open-ssh and expose port 22.

Create a user "coco"

You can build codecombat-base image by executing : 

```sh
make build
```

Override default configuration in the Makefile: 
- name : smoratinos/codecombat-base

You can run (for testing purpose) a container with the codecombat-base image by executing : 

```sh
make run
```

Override default configuration in the Makefile: 
- container ssh port : 22 (set in the Dockerfile)
- host ssh port : 23


DB image
--------------

Use smoratinos/codecombat-base image.

Install mongodb and expose port 27017.

You can build codecombat-db image by executing : 

```sh
make build
```

Override default configuration in the Makefile: 
- name : smoratinos/codecombat-db

You can run a container with the codecombat-db image by executing : 

```sh
make run
```
Override default configuration in the Makefile: 
- container mongodb port : 27017 (set in the Dockerfile)
- host mongodb port : 27017
- container name :codecombat-db
- container data directory : /data/db (mongodb data)
- host data directory : /data/db/coco/

WebServer image
--------------

TODO
