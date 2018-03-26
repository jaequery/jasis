# Ruby Starter Framework

### Pre-requisites

1) docker
2) docker-compose
3) jwilder/proxy

### Install

1) git clone https://github.com/jaequery/jasis
2) cd jasis
3) docker-compose up -d
4) your site should now show up on http://jasis.docker (update VIRTUAL_HOST from docker-compose.yml)


### What is Jasis?

Jasis is an ultra-lightweight website starter kit based on Sinatra framework. By utilizing Docker, it is out-of-the-box development and production ready.

### What does it provide?

It is minimal to the core, but it still has all the features you need, such as:

* Postgres w/ JSONB support
* Models & Migrations & Seeds
* Easy templating with ERB
* Easy to use emails and template support w/ Liquid
* Live error debugging with BetterErrors
* 100% Docker-based environment
* Development / Production environment ready
* Easy deployment to remote servers

### What's the story?

Jasis was inspired by Padrino. But due to their lack of updates and support, I decided I need to start my own without adding any too much syntatic sugars to an incredibly minimal Sinatra.

### What is Jasis?

1. No more black magic (you should know how everything that gets loaded)
2. Less way of doing things the better (less files, less methods, less everything)
3. Keep things stupidly simple (no more crazy class structures, only simple and straight forward approach)
4. Light-weight boilerplate (needs to be fast and performant)
5. 1-step setup and 1-step deploy

### Things you can do

#### Send Emails

1. Configure your SMTP settings from the .env file
2. Call the email() helper function within the controllers

Standard Email
```
email({:from => 'me@email.com', :to => 'user@email.com', :subject => 'hi', :body => 'Hello'})
```

Email through a liquid file
```
email({:to => 'user@email.com', :subject => 'hi'}, {:file => "emails/welcome.liquid", :data => {'name' => 'john'} })
```
