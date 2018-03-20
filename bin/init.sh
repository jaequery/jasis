#!/bin/bash
bundle
rake db:migrate
if [ "$RACK_ENV" = "development" ]
then
  #rerun --background "rackup -s puma -o 0.0.0.0 -p 3000"  
  rackup -s puma -o 0.0.0.0 -p 3000
else
  rackup -s puma -o 0.0.0.0 -p 3000
fi