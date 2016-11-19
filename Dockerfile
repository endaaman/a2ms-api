FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y \
  build-essential \
  ruby \
  ruby-dev \
  libmariadb-client-lgpl-dev \
  zlib1g-dev \
  nginx \
  supervisor

ENV RAILS_ENV production

RUN \
  chown -R www-data:www-data /var/lib/nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  rm /etc/nginx/sites-enabled/default

RUN gem install bundler
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN cd /tmp && bundle install --jobs=4

ADD supervisor.conf /etc/supervisor/conf.d/

RUN mkdir -p /var/www/a2ms-api
ADD . /var/www/a2ms-api
WORKDIR /var/www/a2ms-api

EXPOSE 3000
CMD make db && make serve
