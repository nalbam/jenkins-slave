# Dockerfile

FROM openjdk:8-jdk

MAINTAINER me@nalbam.com

ENV VERSION 3.19

ENV USER jenkins
ENV HOME /home/${USER}

RUN apt-get update && \
    apt-get install -y docker && \
    groupadd -g 10000 jenkins && \
    useradd -c "Jenkins User" -d ${HOME} -u 10000 -g 10000 -m ${USER} && \
    groupadd docker && \
    usermod -aG docker ${USER}

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar \
    https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar && \
    chmod 755 /usr/share/jenkins && \
    chmod 644 /usr/share/jenkins/slave.jar

COPY jenkins-slave /usr/local/bin/jenkins-slave

USER ${USER}

ENV AGENT_WORKDIR=${HOME}/agent

RUN mkdir -p ${HOME}/.jenkins && \
    mkdir -p ${HOME}/agent

VOLUME ${HOME}/.jenkins
VOLUME ${HOME}/agent

WORKDIR ${HOME}

ENTRYPOINT ["jenkins-slave"]
