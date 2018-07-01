#!/bin/bash
# This file is meant to be executed via systemd.
source /usr/local/rvm/scripts/rvm
source /etc/profile.d/rvm.sh
export ruby_ver=$(rvm list default string)

export CONFIGURED=yes
export TIMEOUT=50
export APP_ROOT=/home/rails/rails_project
export RAILS_ENV="production"
export GEM_HOME="/home/rails/rails_project/vendor/bundle"
export GEM_PATH="/home/rails/rails_project/vendor/bundle:/usr/local/rvm/gems/${ruby_ver}:/usr/local/rvm/gems/${ruby_ver}@global"
export PATH="/home/rails/rails_project/vendor/bundle/bin:/usr/local/rvm/gems/${ruby_ver}/bin:${PATH}"

# Passwords
export SECRET_KEY_BASE=ceb6a542e32192bac687939498e6da62041e801d2509ec667d914826e78b4d05e91aa8f972d4e3f4951d11d8865d6b040162788bff946e3ba072d4e6ec381bd4
export APP_DATABASE_PASSWORD=d367ad6b154e3064047159a74b0a9d9d

# Execute the unicorn process
/home/rails/rails_project/vendor/bundle/bin/unicorn \
        -c /etc/unicorn.conf -E production --debug
