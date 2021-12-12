help:
	@echo Opciones:
	@echo -------------------
	@echo start / stop / restart
	@echo build
	@echo logs
	@echo workspace
	@echo stats
	@echo clean
	@echo -------------------

_start-command:
	@docker-compose up -d --remove-orphans

start: _start-command _urls

stop:
	@docker-compose stop

restart: stop start

build:
	@docker-compose build jenkins

logs:
	@docker-compose logs jenkins

workspace:
	@docker-compose exec jenkins /bin/bash

stats:
	@docker stats

clean:
	@docker-compose down -v --remove-orphans

_urls:
	${info }
	@echo -------------------
	@echo [Jenkins] https://jenkins.test
	@echo -------------------
