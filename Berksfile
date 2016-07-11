source "https://supermarket.chef.io"

BERKS_DIR = File.expand_path(File.dirname(__FILE__))
LOCAL_COOKBOOKS_DIR = File.join(File.dirname(__FILE__), 'chef/cookbooks')
LOCAL_COOKBOOK_NAMES = Dir.entries(LOCAL_COOKBOOKS_DIR).reject { |e| e.include?('.') }

def add_cookbook(name, opts={})
  path = File.join(LOCAL_COOKBOOKS_DIR, name)
  cookbook name, opts.merge(path: path)
end

LOCAL_COOKBOOK_NAMES.each do |name|
  add_cookbook(name)
end

cookbook 'database'
cookbook 'mysql'
cookbook 'redisio'