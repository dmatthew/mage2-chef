#
# Cookbook Name:: web
# Recipe:: php
#

if node.chef_environment == 'development'
  cookbook_file 'installing custom xdebug configs'  do
    path   '/etc/php.d/xdebug-config.ini'
    source 'php/xdebug.ini'
    group  'root'
    owner  'root'
    mode   0644
    action :create
    notifies :restart, 'service[php-fpm]', :delayed
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
  notifies :restart, 'service[php-fpm]', :delayed
end

template 'installing www php-fpm pool' do
  path     '/etc/php-fpm.d/www.conf'
  source   'php/www.conf.erb'
  group    'root'
  owner    'root'
  mode     0644
  backup   false
  action   :create
  notifies :restart, 'service[php-fpm]', :delayed
end

# define if not yet defined
begin
  resources('service[php-fpm]')
rescue Chef::Exceptions::ResourceNotFound => e
  service 'php-fpm' do
    action [:enable, :start]
    provider Chef::Provider::Service::Systemd
  end
end

link '/usr/lib64/php/modules/zip.so' do
  to '/opt/remi/php70/root/usr/lib64/php/modules/zip.so'
end

cookbook_file 'load zip extension' do
  path   '/etc/php.d/60-zip.ini'
  source 'php/zip.ini'
  group  'root'
  owner  'root'
  mode   0644
  backup   false
  action   :create
  notifies :restart, 'service[php-fpm]', :delayed
end

cookbook_file 'load zip extension' do
  path   '/etc/php-zts.d/60-zip.ini'
  source 'php/zip.ini'
  group  'root'
  owner  'root'
  mode   0644
  backup   false
  action   :create
  notifies :restart, 'service[php-fpm]', :delayed
end