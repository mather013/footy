#!/bin/sh
sudo service unicorn_footy stop && cd /opt/footy/ && git pull && RAILS_ENV=production bundle exec rake assets:precompile && sudo service unicorn_footy start
