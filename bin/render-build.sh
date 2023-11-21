#!/usr/bin/env bash
# exit on error
set -o errexit

cd rails
bundle install
bundle exec rake db:migrate