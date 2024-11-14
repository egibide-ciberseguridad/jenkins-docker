ARG JENKINS_VERSION=latest-jdk17

FROM jenkins/jenkins:${JENKINS_VERSION}

USER root

ENV DEBIAN_FRONTEND noninteractive

# ----------------------------------------

# Instalar los paquetes adicionales necesarios

# ----------------------------------------

USER jenkins

RUN jenkins-plugin-cli --plugins "docker-workflow"
