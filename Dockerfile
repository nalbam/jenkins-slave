# Dockerfile

FROM jenkins/jnlp-slave:latest

MAINTAINER me@nalbam.com

RUN ln -s /var/jenkins_home/.m2 /home/jenkins/.m2
