#!/bin/bash
source "loader.sh"
ver=$1
if [ -z "$1" ]
  then
    docker exec -it ${app}_app_1 bundle exec rake db:migrate
  else
    docker exec -it ${app}_app_1 bundle exec rake db:migrate[$1]
fi


