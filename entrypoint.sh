#!/bin/bash

echo "Running Entrypoint!"

bundle install --local -j4

if [ "$#" == 0 ]
then
  bundle exec rake db:migrate
  bundle exec unicorn -p $PORT -c config/unicorn.rb
fi

echo "Exec Args..."
exec $@
