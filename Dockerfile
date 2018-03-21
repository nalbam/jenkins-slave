# Dockerfile

FROM java:8

MAINTAINER me@nalbam.com

ENV JENKINS_REMOTING_VERSION 3.18

ENV JENKINS_URL "http://jenkins"

ENV HOME /home/jenkins

RUN useradd -c "Jenkins User" -d ${HOME} -m jenkins

RUN curl --create-dirs -sSLo /usr/share/jenkins/remoting-$JENKINS_REMOTING_VERSION.jar \
  http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/$JENKINS_REMOTING_VERSION/remoting-$JENKINS_REMOTING_VERSION.jar

COPY jenkins-slave.sh /usr/local/bin/jenkins-slave.sh

USER jenkins

VOLUME /home/jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-slave.sh"]
