#
# Cookbook Name:: base
# Recipe:: packages
#

node['mage2']['packages'].each do |pkg|
    package pkg do
        action :install
    end
end

node['mage2']['uninstall'].each do |pkg|
    package pkg do
        action :purge
    end
end