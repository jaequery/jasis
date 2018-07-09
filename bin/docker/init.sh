#!/bin/bash
bundle 
#bash
#PATH=$PATH:/app/volumes/bundler/bin
bundle exec sequel -m db/migrations $DB
bundle exec puma -b tcp://0.0.0.0:3000
