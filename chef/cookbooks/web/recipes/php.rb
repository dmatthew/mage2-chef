#
# Cookbook Name:: web
# Recipe:: php
#

if node.chef_environment == 'development'
  cookbook_file 'installing custom xdebug configs'  do
    path   '/etc/php/7.0/mods-available/xdebug-config.ini'
    source 'php/xdebug.ini'
    group  'root'
    owner  'root'
    mode   0644
    action :create
    notifies :restart, 'service[php7.0-fpm]', :delayed
  end
end

template 'installing php.ini config' do
  path     '/etc/php.ini'
  source   'php/php.ini.erb'
  group    'root'
  owner    'root'
  mode     0644
  backup   false
  action   :create
  notifies :restart, 'service[php7.0-fpm]', :delayed
end

template 'installing www php7.0-fpm pool' do
    path     '/etc/php/7.0/fpm/pool.d/www.conf'
    source   'php/www.conf.erb'
    group    'root'
    owner    'root'
    mode     0644
    backup   false
    action   :create
    variables(
        :options => node['mage2']['php']['fpm']['options'],
    )
    notifies :restart, 'service[php7.0-fpm]', :delayed
end

# define if not yet defined
begin
  resources('service[php7.0-fpm]')
rescue Chef::Exceptions::ResourceNotFound => e
  service 'php7.0-fpm' do
    action [:enable, :start]
    provider Chef::Provider::Service::Systemd
  end
end