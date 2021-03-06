#!/bin/bash

fw_depends mysql rvm rbx-2.5

rvm rbx-$RBX_VERSION do bundle install --jobs=4 --gemfile=$TROOT/Gemfile --path=vendor/bundle

DB_HOST=${DBHOST} rvm rbx-$RBX_VERSION do bundle exec puma -b tcp://0.0.0.0:8080 -e production &
