# Leave me alone! ✅

[![Build Status](https://travis-ci.org/haazime/leave-me-alone.svg?branch=master)](https://travis-ci.org/haazime/leave-me-alone)

Let's todo driven work.

This application helps you getting work to done.

## Requirement

- docker
- docker compose

## Installation

``` console
$ git clone git@github.com:haazime/leave-me-alone.git

# Setting up docker environment.
$ docker-compose build
$ docker-compose up

# On another termianl.
$ docker-compose exec -e RAILS_ENV=development web bundle exec rails db:migrate
```
