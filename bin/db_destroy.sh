#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
parentdir="$(dirname "$dir")"
app=${parentdir##*/}

docker-compose kill app
docker exec -it ${app}_db_1 bash -lc "psql --user=postgres -c 'drop database app'"
docker exec -it ${app}_db_1 bash -lc "psql --user=postgres -c 'create database app'"
docker-compose start app