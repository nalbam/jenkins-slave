# jnlp-slave

Jenkins JNLP Agent Docker image with Docker

## Usage
```
sudo docker pull nalbam/jnlp-slave:latest (123MB)
sudo docker pull nalbam/jnlp-slave:alpine (62MB)

docker run nalbam/jnlp-slave -url http://jenkins-master:port <secret> <agent name>
```

## registry
 * https://hub.docker.com/r/jenkins/slave/
 * https://hub.docker.com/r/jenkins/jnlp-slave/

## source
 * https://github.com/jenkinsci/docker-slave
 * https://github.com/jenkinsci/docker-jnlp-slave
