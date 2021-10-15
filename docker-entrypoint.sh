#!/bin/sh

set -e

echo "Environment: $RAILS_ENV"

# install missing gems
bin/rails db:migrate
bin/rails assets:precompile

# Remove pre-existing puma/passenger server.pid
rm -f $APP_PATH/tmp/pids/server.pid

# run passed commands
bundle exec ${@}
