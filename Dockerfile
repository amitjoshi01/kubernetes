FROM jenkins/jenkins:latest

ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT

# Distributed Builds plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves

# install Notifications and Publishing plugins
RUN /usr/local/bin/install-plugins.sh email-ext
RUN /usr/local/bin/install-plugins.sh mailer
RUN /usr/local/bin/install-plugins.sh slack
RUN /usr/local/bin/install-plugins.sh workflow-aggregator
RUN /usr/local/bin/install-plugins.sh docker-plugin
RUN /usr/local/bin/install-plugins.sh m2release
RUN /usr/local/bin/install-plugins.sh robot

# Scaling
RUN /usr/local/bin/install-plugins.sh kubernetes

USER root
#Test
RUN apt-get update && apt-get install --quiet --assume-yes python-pip unzip wget
# install Maven
RUN apt-get update && apt-get install -y maven
RUN apt-get update && apt-get install -y curl
RUN apt-get install -y vim
RUN curl -sSL https://get.docker.com/ | sh
USER jenkins
