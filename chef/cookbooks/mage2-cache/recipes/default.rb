#
# Cookbook Name:: mage2-cache
# Recipe:: default
#

directory '/var/log/redis' do
    owner 'root'
    group 'root'
    mode  00644
end

redisio_install "redis-installation" do
    version node['mage2']['redisio']['version']
    download_url 'download.redis.io/releases/redis-3.2.1.tar.gz'
    safe_install false
    install_dir '/usr/local/'
end

redisio_configure "redis-servers" do
    version node['mage2']['redisio']['version']
    default_settings node['redisio']['default_settings']
    servers node['redisio']['servers']
    base_piddir node['redisio']['base_piddir']
end