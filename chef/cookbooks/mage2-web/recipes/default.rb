#
# Cookbook Name:: mage2-web
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

include_recipe "mage2-web::nginx"
include_recipe "mage2-web::php"
include_recipe "mage2-web::magerun"
include_recipe "mage2-web::composer"
#include_recipe "mage2-web::magento"
