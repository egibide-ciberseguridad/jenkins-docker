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
	@echo start / stop / restart
	@echo build
	@echo logs
	@echo workspace / workspace-java / workspace-php
	@echo ssh
	@echo stats
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

_start-command:
	@docker compose up -d --remove-orphans

start: _header _start-command _urls

stop:
	@docker compose stop

restart: stop start

build:
	@docker compose build

logs:
	@docker compose logs jenkins

workspace:
	@docker compose exec jenkins /bin/bash

workspace-java:
	@docker compose exec java-runner /bin/bash

workspace-php:
	@docker compose exec php-runner /bin/bash

ssh:
	@docker compose exec php-runner /home/jenkins/generar_clave.sh ${JENKINS_DOCKER_HOST}

stats:
	@docker stats

clean:
	@docker compose down -v --remove-orphans
