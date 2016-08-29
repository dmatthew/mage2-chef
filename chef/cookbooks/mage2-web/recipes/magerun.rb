#
# Cookbook Name:: mage2-web
# Recipe:: mage
#

user  = node['mage2']['deploy']['user']
cache = Chef::Config[:file_cache_path]
mage  = cache + '/n98-magerun.phar'

remote_file mage do
    not_if 'which n98-magerun.phar'
    source 'https://files.magerun.net/n98-magerun-latest.phar'
    owner  user
    group  user
    mode   '0755'
    action :create
end

execute 'install n98-magerun.phar' do
    command "cp #{mage} /usr/local/bin/"
    creates '/usr/local/bin/n98-magerun.phar'
end