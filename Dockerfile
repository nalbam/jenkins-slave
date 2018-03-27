# Dockerfile

FROM jenkins/jnlp-slave:latest

MAINTAINER me@nalbam.com

USER root

RUN apt-get install -y curl docker golang

USER jenkins
