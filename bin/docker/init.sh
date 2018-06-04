#!/bin/bash
bundle 
sequel -m db/migrations $DB
puma -b tcp://0.0.0.0:3000
