#
# Cookbook Name:: web
# Recipe:: nginx
#

template 'installing master nginx config' do
    path     '/etc/nginx/nginx.conf'
    source   'nginx/nginx.conf.erb'
    group    'root'
    owner    'root'
    mode     0644
    backup   false
    action   :create
    notifies :restart, 'service[nginx]', :delayed
    only_if { node.chef_environment == 'development' }
end

node['mage2']['nginx']['hosts'].each do |hostname, config|
  template hostname do
      path     "/etc/nginx/conf.d/#{hostname}.conf"
      source   'nginx/vhost.conf.erb'
      group    'root'
      owner    'root'
      mode     0644
      backup   false
      action   :create
      notifies :restart, 'service[nginx]', :delayed
      variables(
          :hostname => hostname,
          :config   => config
      )
  end
end

service 'nginx' do
    action [:enable, :start]
end