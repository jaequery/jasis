#!/bin/bash
source "loader.sh"
dest=$1
dest="root@0.0.0.0"

rsync -avzr --exclude='.git/' --exclude='volumes' --exclude='*.dat' $parentdir $dest:~/sites/ && ssh $dest "cd ~/sites/$app && docker-compose stop && docker-compose -f docker-compose.live.yml up && docker-compose logs"
