# Dockerfile

FROM jenkins/jnlp-slave:latest

USER root

RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo 'Asia/Seoul' > /etc/timezone

USER jenkins
