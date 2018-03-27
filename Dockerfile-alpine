# Dockerfile

FROM jenkins/jnlp-slave:latest

MAINTAINER me@nalbam.com

USER root

RUN apt update && \
    apt install -y curl docker

USER jenkins

RUN mkdir -p ${HOME}/.m2 && \
    mkdir -p ${HOME}/.gradle

VOLUME ${HOME}/.m2
VOLUME ${HOME}/.gradle
