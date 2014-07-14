#!/usr/bin/env bash

# Install db snapshot

cd /data/db/
echo "downloading snapshot..."
wget https://s3.amazonaws.com/uploads.hipchat.com/60497/416620/DyI9sxIrTmiR6ms/coco_backup_public.tar.gz
echo "snapshot downloaded"
tar xfz coco_backup_public.tar.gz

/usr/bin/mongod &
echo "waiting mongod startup ..."
sleep 30

echo "restoring snapshop"
/usr/bin/mongorestore dump