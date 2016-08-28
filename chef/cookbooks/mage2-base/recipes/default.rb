#
# Cookbook Name:: mage2-base
# Recipe:: default
#

include_recipe "mage2-base::apt"
include_recipe "mage2-base::packages"

# set timezone to UTC
link '/etc/localtime' do
    to '/usr/share/zoneinfo/UTC'
end