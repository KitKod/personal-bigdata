-include .env

.PHONY: env
env:
	cp -n .env.example .env

.PHONY: config-network
config-network:
	docker network create ${NETWORK_NAME} || true

.PHONY: run
run: | config-network
	docker-compose up -d

.PHONY: stop
stop: | config-network
	docker-compose stop

.PHONY: clean-volume
clean-volume:
	docker volume prune -f
