#!/bin/bash
source "loader.sh"
timestamp=$(date +"%m%d%y_%H%M%S")
file="db_"$timestamp".psql"
docker exec -it ${app}_db_1 pg_dump --user=postgres app > ../db/sql/$file
echo "saved to ../db/sql/"$file
