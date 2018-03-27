#!/bin/bash
source "loader.sh"
file=$1

if [ -z "$1" ]
  then
    echo "missing argument"
    echo "ex) ./db_import.sh something.psql"
    exit
fi

docker-compose kill app
docker exec -it ${app}_db_1 bash -lc "psql --user=postgres -c 'drop database app'"
docker exec -it ${app}_db_1 bash -lc "psql --user=postgres -c 'create database app'"
docker exec -it ${app}_db_1 bash -lc "psql --user=postgres app < db/sql/$file"
docker-compose start app