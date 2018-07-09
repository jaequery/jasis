#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
parentdir="$(dirname "$dir")"
app_path=${parentdir##*/} 
export PATH=$PATH:/app/volumes/bundler/bin
da=`docker-compose ps | tail -n 1 | awk '{print $1;}'`

if [[ $da = *"-"* ]]; then
  app="${app_path}"
else
  app="${app_path//-}"
fi

