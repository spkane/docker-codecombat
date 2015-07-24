codecombat docker dev setup
=================

Introduction
--------------

CodeCombat Development environment setup.

If you don't know Docker, you should prefer use [official dev env setup] (https://github.com/codecombat/codecombat/wiki/Developer-environment)

[CodeCombat] (http://codecombat.com) is a multiplayer live coding strategy game. Learn how to code by playing a game !

You must use a codecombat-db container to store data in the db.
And you must use a codecombat-web container to serve the source files and expose a nodejs web server. 

![](http://smoratinos.github.io/docker-codecombat/images/big_picture.png)

Dependencies
--------------

### Docker

Linux Users : Install docker

Windows and Mac Users : Install a Linux in Vagrant and install Docker in your Virtual Machine


Usage
--------------

### First Setup

pull docker images
```sh
make pull-docker
```

restore a db snapshot
```sh
make restore-db
```

pull git repository and compile app
```sh
make install-app
```

And Voilà !

CodeCombat source code is in /data/app/coco/
CodeCombat datas are in /data/db/coco/

You can now run app and modify source code as needed.


### Run CodeCombat

In a terminal run db container
```sh
cd db && make run
```

Ouput expected : 
```sh
2014-07-27 08:27:35,960 INFO success: sshd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2014-07-27 08:27:35,960 INFO success: db_start entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
```

In another terminal run web container
```sh
cd web && make run
```

Ouput expected : 
```sh
2014-07-27 08:28:12,081 INFO success: sshd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2014-07-27 08:28:12,081 INFO success: web_start entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
```

The container will create a directory /data/app/coco/public.
Next it will create a /data/app/coco/dev-server.log

dev-server.log content expected : 

```sh
2014-07-27T08:28:51.848Z - [32minfo[39m: Express SSL server listening on port 3000
2014-07-27T08:28:51.871Z - [32minfo[39m: Successfully connected to MongoDB queue!
```

You can play at http://localhost:3000

Enjoy :)

Contributors
--------------


Build codecombat-db or codecombat-web images : 

```sh
make build
```

Run a container : 

```sh
make run
```

FAQ
--------------

### make: *** No rule to make target 'run'. Arrêt.

You must be root to launch make and docker.

### Error: Conflict, The name codecombat-... is already assigned to ...

```sh
git/docker-codecombat/web# make run                 
mkdir -p "/data/app/coco/"
docker run --rm --link codecombat-db:dbhost --name codecombat-web -p 3000:3000 -p 24:22 -v "/data/app/coco/":/opt/codecombat/ -t -i smoratinos/codecombat-web:latest
2014/07/27 10:18:05 Error: Conflict, The name codecombat-web is already assigned to 8305c9f90d2f. You have to delete (or rename) that container to be able to assign codecombat-web to a container again.
Makefile:23: recipe for target 'run' failed
make: *** [run] Error 1
```
docker stop codecombat-web && docker rm codecombat-web

