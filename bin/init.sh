#!/bin/bash
bundle
rake db:migrate
passenger start --pool-idle-time=0
#puma -b tcp://0.0.0.0:3000
