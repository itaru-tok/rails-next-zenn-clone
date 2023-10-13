.DEFAULT_GOAL := usage

# manage Docker service
build:
	docker compose build --no-cache 

bash:
	docker compose exec rails /bin/bash

bash.next:
	docker compose exec next /bin/bash

up:
	rm -f /myapp/tmp/pids/server.pid
	docker compose up -d
	docker-compose exec rails bundle exec rails s -b 0.0.0.0

up.next:
	docker compose up -d
	docker-compose exec next npm run dev

down:
	docker compose down

# gems
bundle.install:
	docker compose run rails bundle install

rspec:
	docker compose run rails rspec spec

rubocop:
	docker compose run rails rubocop

rubocop.correct:
	docker compose run rails rubocop -A

lint:
	docker compose run next npm run lint

lint.correct:
	docker compose run next npm run format

console:
	docker compose exec rails bundle exec rails c
