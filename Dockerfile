# Dockerfile

FROM jenkins/jnlp-slave:latest

MAINTAINER me@nalbam.com

USER root

RUN apt update && \
    apt install -y curl docker

COPY extra/settings.xml /root/.m2/settings.xml
