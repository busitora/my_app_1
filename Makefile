.PHONY: down
down:
	docker-compose down

.PHONY: up
up:
	docker-compose up -d

.PHONY: build
build:
	docker-compose build

.PHONY: install
install:
	docker-compose run web rails webpacker:install
	docker-compose run web bundle install

.PHONY: create
creaate:
	docker-compose run web rails db:create

.PHONY: web_bash
bash:
	docker exec -it my_app_web_1 bash

.PHONY: console
console:
	docker-compose run --rm web bin/rails console

.PHONY: routes
routes:
	docker-compose run --rm web bin/rails routes

.PHONY: lint
lint:
	docker-compose run --rm web bundle exec rubocop --auto-correct
