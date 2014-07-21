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


DB image
--------------


Build codecombat-db image : 

```sh
make build
```

Restore a db snapshot : 

```sh
make restore
```

Run a container : 

```sh
make run
```

WebServer image
--------------

TODO
