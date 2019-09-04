#!/bin/bash -le
sudo yum -y update
source /etc/profile
echo "Running Deployment for ID: $DEPLOYMENT_ID"
export APP_HOME=/var/www/ams
sudo chown -R ec2-user:ec2-user $APP_HOME
cd $APP_HOME
echo "Ensuring bundler is installed..."
gem install bundler
bundle install --deployment --without development test
echo "ruby version:`ruby -v`"
echo "rails versions:`bundle exec rails -v`"
echo "node version:`node -v`"
echo "yarn version:`yarn -v`"
bundle exec rails db:migrate
bundle exec rails assets:precompile
if [ -z $SECRET_KEY_BASE ]; then
sudo echo "export SECRET_KEY_BASE=`bundle exec rails secret`" >> /etc/profile
source /etc/profile
fi
bin/rails g deployment_info_page --deployment_id $DEPLOYMENT_ID
sudo service httpd restart
sleep 2
RESTART=true ruby bin/scripts/ensure_sidekiq_running.rb
sleep 2
echo "End of install.sh"
exit 0;
