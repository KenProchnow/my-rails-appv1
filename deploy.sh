#!/bin/bash

#PREP
USER_HOST="rails@159.65.98.168"
REMOTE_DIR="/home/rails/rails_project"
set -e #exit on any error

# not sure i need this right now
# git pull

#LOCAL
#run tests
bundle exec rake
#clear temp files
bundle exec rake tmp:clear
#precompile assets
#bundle exec rake assets:precompile
#copy files
rsync -rvuz ./ ${USER_HOST}:${REMOTE_DIR} --exclude='.git/' --exclude='log/' --exclude='tmp/cache' --delete


#clear tmp files after precompile
bundle exec rake tmp:clear

#REMOTE
#bundle install
ssh ${USER_HOST} 'cd ${REMOTE_DIR} && bundle install --without development test'
#database migrate
ssh ${USER_HOST} 'cd ${REMOTE_DIR} && bundle exec rake db:migrate RAILS_ENV="production"'
#clear temp files
ssh ${USER_HOST} 'cd ${REMOTE_DIR} && bundle exec rake tmp:clear'
#clear log files
ssh ${USER_HOST} 'cd ${REMOTE_DIR} && bundle exec rake log:clear'

#restart app, i dont have restart setup though, i wonder if this would work
# ssh ${USER_HOST} 'touch ${REMOTE_DIR}/tmp/restart.txt'

ssh ${USER_HOST} 'service unicorn restart'


echo "Deploy Successful!"