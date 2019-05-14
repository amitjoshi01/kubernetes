FROM jenkins/jenkins:latest

# Distributed Builds plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves

# install Notifications and Publishing plugins
RUN /usr/local/bin/install-plugins.sh docker-plugin
RUN /usr/local/bin/install-plugins.sh m2release
RUN /usr/local/bin/install-plugins.sh robot
RUN /usr/local/bin/install-plugins.sh kubernetes-cli
RUN /usr/local/bin/install-plugins.sh credentials
RUN /usr/local/bin/install-plugins.sh docker-workflow
RUN /usr/local/bin/install-plugins.sh git
RUN /usr/local/bin/install-plugins.sh github-api
RUN /usr/local/bin/install-plugins.sh github
RUN /usr/local/bin/install-plugins.sh kubernetes
RUN /usr/local/bin/install-plugins.sh workflow-aggregator
RUN /usr/local/bin/install-plugins.sh workflow-step-api
RUN /usr/local/bin/install-plugins.sh scm-api
RUN /usr/local/bin/install-plugins.sh ssh-credentials

# Scaling
#RUN /usr/local/bin/install-plugins.sh kubernetes

USER root
#Test
RUN apt-get update && apt-get install --quiet --assume-yes python-pip unzip wget
# install Maven
RUN apt-get update && apt-get install -y maven
RUN apt-get update && apt-get install -y curl
RUN apt-get install -y vim

#install kubectl
RUN apt-get update && apt-get install -y apt-transport-https
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl
RUN curl -sSL https://get.docker.com/ | sh
USER jenkins

# pip install
RUN pip install pycryptodome
