# Dockerfile

FROM openjdk:8-slim

MAINTAINER me@nalbam.com

ENV USER jenkins
ENV HOME /home/${USER}

ARG VERSION=3.19
ARG AGENT_WORKDIR=${HOME}/agent

RUN apt-get update && \
    apt-get install -y curl docker && \
    groupadd -g 10000 ${USER} && \
    useradd -c "Jenkins User" -d ${HOME} -u 10000 -g 10000 -m ${USER} && \
    groupadd docker && \
    usermod -aG docker ${USER}

COPY jenkins-slave /usr/local/bin/jenkins-slave

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar \
    https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar && \
    chmod 755 /usr/share/jenkins && \
    chmod 644 /usr/share/jenkins/slave.jar && \
    chmod 755 /usr/local/bin/jenkins-slave

USER ${USER}

ENV AGENT_WORKDIR=${AGENT_WORKDIR}

RUN mkdir -p ${HOME}/.m2 && \
    mkdir -p ${HOME}/.gradle && \
    mkdir -p ${HOME}/.jenkins && \
    mkdir -p ${HOME}/agent

VOLUME ${HOME}/.m2
VOLUME ${HOME}/.gradle
VOLUME ${HOME}/.jenkins
VOLUME ${HOME}/agent

WORKDIR ${HOME}

ENTRYPOINT ["jenkins-slave"]
