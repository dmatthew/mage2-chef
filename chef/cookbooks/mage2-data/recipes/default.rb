#
# Cookbook Name:: mage2-data
# Recipe:: default
#

# install gem dependancy
mysql2_chef_gem 'default' do
    action         :install
    client_version node['mage2']['mysql']['version']
end

# install mysql
mysql_service 'default' do
    port         node['mage2']['mysql']['port']
    bind_address '0.0.0.0'
    version      node['mage2']['mysql']['version']
    initial_root_password node['mage2']['mysql']['root_pass']
    action [:create, :start]
end

mysql_connection_info = {
    :host     => node['mage2']['mysql']['host'],
    :port     => node['mage2']['mysql']['port'],
    :username => node['mage2']['mysql']['root_user'],
    :password => node['mage2']['mysql']['root_pass']
}

# create a mysql database
node['mage2']['mysql']['databases'].each do |db|
    database db do
        provider   Chef::Provider::Database::Mysql
        connection mysql_connection_info
        action     :create
    end
end

# create a basic user and grant privileges
node['mage2']['mysql']['users'].each do |user_data|
    database_user user_data['user'] do
        provider   Chef::Provider::Database::MysqlUser
        connection mysql_connection_info
        database_name node['mage2']['mysql']['database']
        password   user_data['password']
        host       user_data['host']
        privileges user_data['privileges']
        action     [:create, :grant]
    end
end