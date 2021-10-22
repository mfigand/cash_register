# cash_register

Amenitiz code challenge

[Instructions](https://github.com/mfigand/cash_register/blob/main/public/pdfs/technical-evaluation-amenitiz.pdf "Instructions")

## Install steps

From root:

Build the image
* docker-compose build

Install packages
* docker-compose run --rm app bundle exec yarn install

Prepare the database
* docker-compose run --rm app bundle exec rails db:prepare

Boot the app
* docker-compose up

Run specs
* docker-compose run --rm app bundle exec rspec

Run lints (rubocop)
* docker-compose run --rm app bundle exec rubocop

Check coverage from root type
* open coverage/index.html

## Things you may want to cover:

* Ruby version ruby-3.0.1

* Rails version 6.1

* System dependencies
  - docker
  - docker-compose

## Heroku deploy docker image:

* docker-compose run --rm app bundle exec rails RAILS_ENV=production assets:precompile
* rm -R tmp/pids

* heroku container:login 
* heroku container:push web --app amenitiz-code-challenge
* heroku container:release web --app amenitiz-code-challenge