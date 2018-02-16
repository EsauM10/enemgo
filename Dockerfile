
FROM ruby:2.4

RUN apt-get update -qq && apt-get install -qq -y curl apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update -qq

RUN apt-get install -qq -y build-essential libpq-dev yarn nodejs imagemagick
#Install cron and start
RUN apt-get install -y cron

RUN mkdir -p /enemgo

WORKDIR /enemgo

COPY Gemfile /enemgo/Gemfile
COPY Gemfile.lock /enemgo/Gemfile.lock

RUN yarn install

ENV BUNDLE_PATH=/enemgo_gems
ENV RAILS_ENV=development

COPY . /enemgo

RUN gem install backup -v5.0.0.beta.1 --no-ri --no-rdoc
RUN bundle install --binstubs
RUN gem install whenever --no-ri --no-rdoc

ADD backup/config.rb /root/Backup/config.rb
ADD backup/model.rb /root/Backup/models/

VOLUME ["/home/backups", "/etc/backups", "/var/lib/backups", "/var/log/backups"]

RUN bundle exec whenever --update-crontab
