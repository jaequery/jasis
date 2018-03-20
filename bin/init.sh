#!/bin/bash
bundle
rake db:migrate
rackup -s puma -o 0.0.0.0 -p 3000
#passenger start --pool-idle-time=0
#puma -b tcp://0.0.0.0:3000
