#!/bin/bash
source "loader.sh"
docker exec -it ${app}_app_1 bundle exec racksh
