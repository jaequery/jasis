# Docker Ruby / Sinatra 

### Pre-requisites

1) docker
2) docker-compose
3) jwilder/proxy

### Install

1) git clone https://github.com/jaequery/jasis
2) cd jasis
3) docker-compose up -d
4) your site should now show up on http://jasis.docker
5) you can modify the docker-compose.yml and change the VIRTUAL_HOST to your desired domain name

### What is Jasis?

Jasis is an ultra-lightweight website starter kit based on Sinatra framework.

### Why Jasis?

It is minimal to the core, but it still has all the features you need, such as:

* Postgres w/ JSONB support
* Models & Migrations
* Redis Storage
* Easy templating with ERB
* Live error debugging with BetterErrors
* 100% Docker-based environment

*** What's the story?

Jasis was inspired by Padrino. But due to their lack of updates and support, I decided I need to start my own without adding any too much syntatic sugars to an incredibly minimal Sinatra.