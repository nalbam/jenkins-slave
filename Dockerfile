# Dockerfile

FROM jenkins/jnlp-slave:latest

MAINTAINER me@nalbam.com

RUN ln -s /home/jenkins/jenkins_home/.m2/settings.xml /home/jenkins/.m2/settings.xml
