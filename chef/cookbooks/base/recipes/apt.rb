#
# Cookbook Name:: base
# Recipe:: apt
#

stamp = '/tmp/apt-updated'

execute 'update apt-cache' do
    command "apt-get update && touch #{stamp}"
    not_if { ::File.exists?(stamp) }
end

execute 'update apt-cache once in a while' do
    command "apt-get update && touch #{stamp}"
    only_if do
      File.exists?(stamp) && File.mtime(stamp) < Time.now - 60_000
    end
end