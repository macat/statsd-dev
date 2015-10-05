FROM ruby:2.2

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN gem install term-ansicolor

CMD ruby statsd.rb
