#
# Cookbook Name:: data
# Recipe:: default
#

# install gem dependancy
mysql2_chef_gem 'default' do
  action         :install
  client_version '5.7'
end

# install mysql
mysql_service 'default' do
  port         '3306'
  bind_address '0.0.0.0'
  version      '5.7'
  initial_root_password '9g87rihf74hf74hf14290df821a3ee57c86jg741'
  action [:create, :start]
end

mysql_connection_info = {
  :host     => '127.0.0.1',
  :port     => '3306',
  :username => 'root',
  :password => '9g87rihf74hf74hf14290df821a3ee57c86jg741'
}

# create a mysql database
database 'mage2_development' do
  provider   Chef::Provider::Database::Mysql
  connection mysql_connection_info
  action     :create
end

# create a basic user and grant privileges
database_user 'mage2' do
  provider   Chef::Provider::Database::MysqlUser
  connection mysql_connection_info
  database_name 'mage2_development'
  password   'hg7549331581ae9b84hfa4f84648785jf61bdmb9'
  host       '%'
  privileges [:all]
  action     [:create, :grant]
end