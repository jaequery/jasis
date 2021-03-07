FROM ruby:3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client
#RUN apt-get install emacs24-nox -y
ENV TERM xterm-256color
RUN mkdir /app
WORKDIR /app
RUN gem install bundler
EXPOSE 3000