FROM ruby:alpine
# Copyright (C) 2018 Mateusz Pawlowski <mateusz@generik.co.uk>
MAINTAINER Mateusz Pawlowski @ Generik Ltd


ADD Gemfile* /app/
WORKDIR /app
RUN bundle

ADD convert.rb /app/

WORKDIR /data

ENTRYPOINT ["/app/convert.rb"]

#vim: syntax=Dockerfile
