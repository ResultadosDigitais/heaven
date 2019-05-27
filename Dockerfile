FROM ruby:2.3.1
MAINTAINER Henrich Moraes <henrich.moraes@resultadosdigitais.com.br>

ENV WORK_DIR /var/app

RUN mkdir -p $WORK_DIR

WORKDIR $WORK_DIR

RUN gem update --system

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY vendor/cache vendor/cache
RUN bundle install --local -j4

COPY . .
