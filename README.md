# Ruby Starter Framework

Jasis is an eloquent Ruby framework, that provides you a nice boilerplate code to get you started developing websites as quickly as possible.
It was inspired heavily by Padrino, but it takes it a notch further in terms of simplification by keeping Sinatra to it's core as much as possible. You won't see any Jasis library here, it will be just several Ruby gems put together on top of the Sinatra framework.

### What is Jasis?

1. No more black magic (you should know how everything that gets loaded)
2. Less way of doing things the better (less files, less methods, less everything)
3. Keep things stupidly simple (no more crazy class structures, only simple and straight forward approach)
4. Light-weight boilerplate (needs to be fast and performant)
5. 1-step setup and 1-step deploy


### Pre-requisites

1) docker
2) docker-compose
3) jwilder/proxy

Run the jwilder/proxy daemon if you haven't already:

```
docker run --name=proxy --restart=always -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
```

### Install
1) git clone https://github.com/jaequery/jasis
2) cd jasis
3) docker-compose up -d
4) your site should now show up on http://jasis.docker (update VIRTUAL_HOST from docker-compose.yml)


### Things you can do

### dotenv for dev / production environment variables
To set environmental variables depending on your environment, we used dotenv. You simply place a .env file at the root of the app folder.

.env (base)
.env.development
.env.production

Within it, you can simply have:

```
TWITTER_KEY=xxxxx
TWITTER_SECRET=xxxxx
```

And you would call it from your app using:

```
ENV['TWITTER_KEY']
```

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
