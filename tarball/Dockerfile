FROM ruby:2.7.2
# install packages
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  nano \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn && \
  apt-get update && apt-get -y install rsync && \
  apt-get install -y wget xvfb unzip && \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
  apt-get update -y && apt-get install -y google-chrome-stable

ENV CHROME_BIN=/usr/bin/google-chrome
RUN curl https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip -o /usr/local/bin/chromedriver
RUN chmod +x /usr/local/bin/chromedriver
# Install bundler
RUN gem install bundler && bundle config path /usr/local/bundle
# Make work directory
RUN mkdir -p /usr/local/educative/gatherer
WORKDIR /usr/local/educative/gatherer
# copy gem files
COPY ./gatherer/Gemfile /usr/local/educative/gatherer/Gemfile
COPY ./gatherer/Gemfile.lock /usr/local/educative/gatherer/Gemfile.lock
# Install bundle
RUN gem update bundler && bundle update && bundle check || bundle install 
# copy .json and .lock files
COPY ./gatherer/package.json /usr/local/educative/gatherer/package.json
COPY ./gatherer/yarn.lock /usr/local/educative/gatherer/yarn.lock
# COPY all files
COPY ./gatherer /usr/local/educative/gatherer

#install yarn
RUN yarn install && \
    npm install webpack-dev-server -g && \
    gem install foreman && \
    yarn add @rails/webpacker && bundle update webpacker && \
    npm install karma --save-dev && \
    gem install rails bundler && \
    gem install rack-test && \
    cd /usr/local/educative/gatherer/ && \
    yarn install --check-files && \
    npm install 

WORKDIR /usr/local/educative/myapp
COPY ./app /usr/local/educative/myapp
RUN cd /usr/local/educative/myapp &&\
    gem update bundler && bundle update && bundle check || bundle install &&\
    yarn install --check-files && \
    npm install
