#!/bin/sh

set -e

echo "Environment: $RAILS_ENV"

bin/rails db:migrate
bin/rails assets:precompile
export RAILS_SERVE_STATIC_FILES=true

# Remove pre-existing puma/passenger server.pid
rm -f $APP_PATH/tmp/pids/server.pid

# run passed commands
bundle exec ${@}
