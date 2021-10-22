# Latest version of ubuntu as base image
FROM    ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
# Install the following packages
RUN apt-get update &&\
    apt-get -y install ruby-full &&\
    apt-get -y install sqlite3 &&\
    apt-get update &&\
    apt-get -y install nodejs npm &&\
    npm install --global yarn &&\
    npm install autoprefixer &&\
    yarn add autoprefixer &&\
    npm install postcss-import &&\
    npm install -D tailwindcss@latest postcss@latest autoprefixer@latest &&\
    npm install postcss-nesting &&\
    npm install autoprefixer

WORKDIR /usr/local
COPY . /usr/local