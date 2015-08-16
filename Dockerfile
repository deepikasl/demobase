FROM ubuntu:14.04
# MAINTAINER Avi "avi@shippable.com"

ENV DEBIAN_FRONTEND noninteractive

# core setup up which is layer 1
ADD layer1.sh /tmp/
RUN /bin/bash /tmp/layer1.sh

# force all apt-get commands with a yes
ADD 90forceyes /etc/apt/apt.conf.d/

# Disabling scrict host checking for ssh
ADD config /root/.ssh/config;

# gcloud setup up
ADD google-cloud-sdk /opt/gcloud/google-cloud-sdk
ADD layer2.sh /tmp/
RUN /bin/bash /tmp/layer2.sh

# Installing python requirements
ADD requirements.txt /root/demobase/
RUN pip install -r /root/demobase/requirements.txt
