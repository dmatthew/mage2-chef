#
# Cookbook Name:: web
# Recipe:: composer
#

execute 'install composer' do
  creates '/usr/local/bin/composer.phar'
  command 'curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer.phar'
  action :run
end