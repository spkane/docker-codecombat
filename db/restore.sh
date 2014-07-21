#!/usr/bin/env bash

# Install db snapshot

DB_DIR="/data/db/"

mkdir -p $DB_DIR
cd $DB_DIR
echo "downloading snapshot..."
wget https://s3.amazonaws.com/uploads.hipchat.com/60497/416620/DyI9sxIrTmiR6ms/coco_backup_public.tar.gz
echo "snapshot downloaded"
tar xfz coco_backup_public.tar.gz

/usr/bin/mongod &
echo "waiting mongod startup ..."
sleep 30

echo "restoring snapshop"
/usr/bin/mongorestore dump
echo "restore successfull"
