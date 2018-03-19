#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
parentdir="$(dirname "$dir")"
app=${parentdir##*/}
ver=$1

if [ -z "$1" ]
  then
    docker exec -it ${app}_app_1 rake db:migrate
  else
    docker exec -it ${app}_app_1 rake db:migrate[$1]
fi


