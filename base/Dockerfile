FROM ubuntu:14.04

MAINTAINER Sébastien Moratinos <codecombat@sebastien-moratinos.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C
ENV HOME /root

RUN \
  echo " ###### Ubuntu Main Repos \n" > /etc/apt/sources.list && \
  echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty main restricted universe multiverse\n" \
    >> /etc/apt/sources.list && \
  echo "\n###### Ubuntu Update Repos\n" >> /etc/apt/sources.list && \
  echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse\n" \
    >> /etc/apt/sources.list && \
  echo "deb http://fr.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe multiverse\n" \
    >> /etc/apt/sources.list

RUN \
  apt-get update && \
  apt-get install -y -q \
    vim \
    git \
    wget \
    g++ make
  apt-get clean


# Install Supervisor (permit multiple service in the same container)
RUN \
  apt-get install -y -q supervisor && \
  mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf


# Install OpenSSH
RUN \
  apt-get install -y -q openssh-server && \
  mkdir /var/run/sshd && \
  echo 'root:root' | chpasswd && \
  sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -ri 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
  sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
EXPOSE 22

RUN useradd -m -d /home/coco -p coco coco && adduser coco sudo && chsh -s /bin/bash coco

CMD ["/usr/bin/supervisord"]
