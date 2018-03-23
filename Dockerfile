# Dockerfile

FROM java:8

MAINTAINER me@nalbam.com

ENV VERSION 3.19

ENV USER jenkins
ENV HOME /home/${USER}

RUN apt-get update && \
    apt-get install -y docker && \
    groupadd docker && \
    useradd -c "Jenkins User" -d ${HOME} -m ${USER} && \
    usermod -aG docker ${USER}

RUN curl --create-dirs -sSLo /usr/share/jenkins/remoting-$VERSION.jar \
    http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/$VERSION/remoting-$VERSION.jar

COPY jenkins-slave.sh /usr/local/bin/jenkins-slave.sh && \
     chmod +x /usr/local/bin/jenkins-slave.sh

USER ${USER}

RUN mkdir -p ${HOME}/.jenkins && \
    mkdir -p ${HOME}/agent

VOLUME ${HOME}/.jenkins
VOLUME ${HOME}/agent

WORKDIR ${HOME}

ENTRYPOINT ["/usr/local/bin/jenkins-slave.sh"]
