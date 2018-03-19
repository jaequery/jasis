#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
parentdir="$(dirname "$dir")"
app=${parentdir##*/}
dest=$1
dest="root@0.0.0.0"
rsync -avzr --exclude='.git/' --exclude='*.dat' $parentdir $dest:~/sites/ && ssh $dest "cd ~/sites/$app && docker-compose stop && docker-compose -f docker-compose.live.yml up && docker-compose logs"