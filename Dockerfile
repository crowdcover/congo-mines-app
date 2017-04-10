FROM ruby:2.1

MAINTAINER Kris Carle <kris@maphubs.com>

RUN apt-get update && apt-get install -y nodejs && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install bundler

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN cd /app && bundle install

ADD . /app  
ADD config/database.yml.docker /app/config/database.yml

WORKDIR /app 
EXPOSE 3000
CMD /app/docker-entrypoint.sh