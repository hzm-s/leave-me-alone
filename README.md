# Leave me alone! 👏 

[![Build Status](https://travis-ci.org/haazime/leave-me-alone.svg?branch=master)](https://travis-ci.org/haazime/leave-me-alone)
[![Maintainability](https://api.codeclimate.com/v1/badges/5cd2a944f159734024b7/maintainability)](https://codeclimate.com/github/haazime/leave-me-alone/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/5cd2a944f159734024b7/test_coverage)](https://codeclimate.com/github/haazime/leave-me-alone/test_coverage)

Let's todo driven work.

This application helps you to getting work done.

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
