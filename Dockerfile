FROM ruby:3.0.2

ENV APP_PATH /app
ENV BUNDLE_PATH /usr/local/bundle/gems
ENV TMP_PATH /tmp/
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_PORT 3000
ENV RAILS_ENV production

# install dependencies for application
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y build-essential nodejs yarn imagemagick tzdata gcc-9

# copy entrypoint scripts and grant execution permissions
COPY ./docker-entrypoint.sh /usr/bin/entrypoint.sh
RUN mkdir -p $APP_PATH && chmod +x /usr/bin/entrypoint.sh
WORKDIR $APP_PATH

RUN gem install bundler

COPY Gemfile $APP_PATH/Gemfile
COPY Gemfile.lock $APP_PATH/Gemfile.lock
RUN bundle install

# navigate to app directory

EXPOSE $RAILS_PORT

ENTRYPOINT [ "entrypoint.sh" ]
CMD ["rails server -b 0.0.0.0 -p 3000"]
