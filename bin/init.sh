#!/bin/bash
bundle
passenger start --pool-idle-time=0
#puma -b tcp://0.0.0.0:3000
