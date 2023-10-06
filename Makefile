.DEFAULT_GOAL := usage

bash:
	docker compose exec rails /bin/bash

down:
	docker compose down

# for intel
init:
	docker compose build
	docker compose run rails bundle install
	docker compose run rails bundle exec rake db:create
	docker compose run rails bundle exec rake db:railsly
	docker compose run rails bundle exec rake db:railsly RAILS_ENV=test
	docker compose run rails bundle exec rake db:seed_fu

lint.javascript:
	docker compose run rails yarn format

up:
	docker compose up -d
	docker compose exec rails /bin/bash
	bundle exec rails s -b 0.0.0.0

db.reset:
	docker compose run rails bundle exec rake db:drop
	docker compose run rails bundle exec rake db:create
	docker compose run rails bundle exec rake db:railsly
	docker compose run rails bundle exec rake db:railsly RAILS_ENV=test
	docker compose run rails bundle exec rake db:seed_fu

bundle.install:
	docker compose run rails bundle install

rspec:
	docker compose run -e rails bundle exec rspec spec

db.railsly:
	docker compose run rails bundle exec rake db:railsly
	docker compose run rails bundle exec rake db:railsly RAILS_ENV=test

rubocop:
	docker compose run rails bundle exec rubocop

rubocop.correct:
	docker compose run rails bundle exec rubocop -A

# be common
erblint:
	docker compose run rails bundle exec erblint --lint-all

erblint.correct:
	docker compose run rails bundle exec erblint --lint-all -a

test: rubocop rspec

down.all:
	if [ -n "`docker ps -q`" ]; then docker kill `docker ps -q`; fi
	docker container prune -f

console:
	docker compose exec rails bundle exec rails c

webpack:
	docker compose exec rails bin/webpack
