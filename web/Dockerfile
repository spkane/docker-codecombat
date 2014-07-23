FROM smoratinos/codecombat-base

MAINTAINER Sébastien Moratinos <codecombat@sebastien-moratinos.com>

# Update Supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install Node.js
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bash_profile

RUN apt-get update && \
  apt-get install -y -q \
  ruby1.9.1 ruby1.9.1-dev \
  npm


RUN \
  npm install -g brunch && \
  npm install -g bower && \
  gem install sass

ADD install.sh /root/install.sh
RUN chmod +x /root/install.sh
ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh

ENV COCO_MONGO_HOST dbhost
ENV NODE_ENV development

EXPOSE 3000

CMD ["/usr/bin/supervisord"]
