#!/usr/bin/env bash

LOG="/home/coco/start.log"
COCOFILE="/data/db/coco.ns"

if [ -f $(COCOFILE) ]
then
  echo "Coco data files $COCOFILE found. CodeCombat data already installed" >> $LOG
  /usr/bin/mongod
else
  echo "Coco data files $COCOFILE not found. Installing data..." >> $LOG

  /home/coco/install.sh >> $LOG
  echo "CodeCombat data installed" >> $LOG
fi

