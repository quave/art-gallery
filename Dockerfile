FROM ruby:3.0.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
RUN yarn install
VOLUME /app
CMD [ "rails", "server", "-b", "0.0.0.0" ]
