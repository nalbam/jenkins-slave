# Dockerfile

FROM jenkins/jnlp-slave:latest

MAINTAINER me@nalbam.com

RUN ln -s /home/jenkins/jenkins_home/.m2 /home/jenkins/.m2
