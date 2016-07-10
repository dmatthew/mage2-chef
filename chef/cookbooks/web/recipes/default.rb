#
# Cookbook Name:: web
# Recipe:: default
#

if node.chef_environment == 'development'
    execute 'hosts entry for website'  do
        command "echo '127.0.0.1\tdev.mage2-chef.com #added' >> /etc/hosts"
        action  :run
        not_if 'grep added /etc/hosts'
    end

    execute 'hosts entry for database'  do
        command "echo '192.168.140.20\tdata.dev.mage2-chef.com data' >> /etc/hosts"
        action  :run
        not_if 'grep data /etc/hosts'
    end
end

include_recipe "web::nginx"
include_recipe "web::php"
#include_recipe "web::magerun"
#include_recipe "web::composer"
#include_recipe "web::magento"