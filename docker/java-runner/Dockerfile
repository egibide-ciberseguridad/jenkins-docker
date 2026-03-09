ARG INBOUND_AGENT_VERSION=latest-jdk17

FROM jenkins/inbound-agent:${INBOUND_AGENT_VERSION}

USER root

ENV DEBIAN_FRONTEND noninteractive

# ----------------------------------------

RUN apt-get update && apt-get install -y maven

# ----------------------------------------

USER jenkins
