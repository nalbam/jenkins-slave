# jnlp-slave

Jenkins JNLP Agent Docker image with Docker

## Usage
```
sudo docker pull nalbam/jnlp-slave:latest (123MB)

docker run nalbam/jnlp-slave -url http://jenkins-master:port <secret> <agent name>
```

## registry
 * https://hub.docker.com/r/jenkins/slave/
 * https://hub.docker.com/r/jenkins/jnlp-slave/

## source
 * https://github.com/docker-library/openjdk
 * https://github.com/jenkinsci/docker-slave
 * https://github.com/jenkinsci/docker-jnlp-slave

## plugin
 * https://github.com/jenkinsci/kubernetes-plugin
