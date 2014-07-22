#!/usr/bin/env bash

/opt/codecombat/bin/coco-brunch >> /opt/codecombat/brunch.log & 2>&1
sleep 30
/opt/codecombat/bin/coco-dev-server >> /opt/codecombat/dev-server.log & 2>&1