FROM smoratinos/codecombat-base

MAINTAINER Sébastien Moratinos <codecombat@sebastien-moratinos.com>

# Update Supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install MongoDB
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' \
    | tee /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y -q mongodb-org && \
  mkdir -p /data/db
EXPOSE 27017

ADD restore.sh /root/restore.sh

CMD ["/usr/bin/supervisord"]
