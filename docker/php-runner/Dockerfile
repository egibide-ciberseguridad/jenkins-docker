ARG INBOUND_AGENT_VERSION=latest-jdk17

FROM jenkins/inbound-agent:${INBOUND_AGENT_VERSION}

USER root

ENV DEBIAN_FRONTEND noninteractive

# ----------------------------------------

RUN apt-get update && apt-get install -y lsb-release curl

# Instalar PHP8: https://www.linuxcapable.com/how-to-install-php-8-on-debian-11-bullseye/
ARG PHP_VERSION=8.3
ENV PHP_VERSION ${PHP_VERSION}

RUN apt-get update
RUN apt-get install -y ca-certificates apt-transport-https wget nano
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN apt-get update
RUN apt-get install -y php${PHP_VERSION}-cli php${PHP_VERSION}-sqlite php${PHP_VERSION}-xml php${PHP_VERSION}-curl

# Instalar composer
RUN apt-get install -y composer

# Instalar node
RUN apt-get install -y nodejs npm

USER jenkins
