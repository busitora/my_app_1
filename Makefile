.PHONY: down
down:
	docker-compose down

.PHONY: up
up:
	docker-compose up -d

.PHONY: build
build:
	docker-compose up build

.PHONY: install
install:
	docker-compose run web rails webpacker:install
	docker-compose run web rails db:create
