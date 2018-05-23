# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


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
