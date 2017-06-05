#!/bin/sh
sudo service unicorn_footy stop && cd /opt/footy/ && git pull && sudo service unicorn_footy start
