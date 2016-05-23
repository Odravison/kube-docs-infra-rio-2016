FROM ruby:2.2.3

RUN apt-get update && apt-get install -y build-essential nodejs npm
RUN mkdir -p /usr/src/tocha-server

WORKDIR /usr/src/tocha-server
ADD Gemfile /usr/src/tocha-server/Gemfile
ADD Gemfile.lock /usr/src/tocha-server/Gemfile.lock
RUN bundle install --without development test

ADD . /usr/src/tocha-server

EXPOSE 3000
