#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo ------------------------------------------
	@echo build
	@echo start / stop / restart / stop-all
	@echo password
	@echo ------------------------------------------
	@echo workspace / workspace-java / workspace-php
	@echo ssh
	@echo logs / stats
	@echo clean
	@echo ------------------------------------------

_header:
	@echo -------
	@echo Jenkins
	@echo -------

_urls: _header
	${info }
	@echo ------------------------------------------
	@echo [Jenkins] https://jenkins.test
	@echo ------------------------------------------

build:
	@docker compose build --pull

_start-command:
	@docker compose up -d --remove-orphans

start: _header _start-command _urls

stop:
	@docker compose stop

restart: stop start

stop-all:
	@docker stop $(shell docker ps -aq)

password:
	@docker compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

workspace:
	@docker compose exec jenkins /bin/bash

workspace-java:
	@docker compose exec java-runner /bin/bash

workspace-php:
	@docker compose exec php-runner /bin/bash

ssh:
	@docker compose exec php-runner generar_clave.sh ${JENKINS_DOCKER_HOST}

logs:
	@docker compose logs jenkins

stats:
	@docker stats

clean:
	@docker compose down -v --remove-orphans
