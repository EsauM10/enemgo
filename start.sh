bundle check || bundle install
bundle exec rails server -b 0.0.0.0 && cron -r
