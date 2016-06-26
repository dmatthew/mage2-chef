#
# Cookbook Name:: base
# Recipe:: default
#

include_recipe "base::apt"
include_recipe "base::packages"

# set timezone to UTC
link '/etc/localtime' do
    to '/usr/share/zoneinfo/UTC'
end