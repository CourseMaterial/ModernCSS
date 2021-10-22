FROM ruby:3.0.0
RUN apt-get update && apt-get install -y \
  curl vim wget\
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
  apt-get -y install sqlite3 &&\
  apt-get update &&\
  apt-get -y install nodejs &&\
  npm install --global yarn &&\
  npm install autoprefixer &&\
  yarn add autoprefixer &&\
  npm install postcss-import &&\
  npm install -D tailwindcss@latest postcss@latest autoprefixer@latest &&\
  npm install postcss-nesting &&\
  npm install autoprefixer

WORKDIR /usr/local
COPY . /usr/local

RUN cd /usr/local/main && bundle install
RUN gem install rails

EXPOSE 3000
