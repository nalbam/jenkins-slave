# Dockerfile

FROM jenkins/jnlp-slave:latest

MAINTAINER me@nalbam.com

RUN sudo apt-get update && \
    sudo apt-get install -y curl docker golang
