#!/bin/bash
bundle 
rake db:migrate
puma -b tcp://0.0.0.0:3000
