FROM ruby:2.2-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
	apt-get install -y \
	build-essential \
	nodejs \
	libpq-dev \
	libsqlite3-dev \
	libqt5webkit5-dev \
	qt5-default \
	xvfb

# Copy project src to container
COPY ./Gemfile /app/
COPY ./Gemfile.lock /app/
COPY ./Rakefile /app/
COPY ./config/* /app/config/

# Set /app as workdir
WORKDIR /app

# Install dependencies
RUN bundle install

#DB 
RUN rake db:setup
RUN "rake siwapp:user:create['admin','admin@example.com','admin']"
