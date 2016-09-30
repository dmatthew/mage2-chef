#
# Cookbook Name:: mage2-web
# Recipe:: magento
#

app_parent  = node['mage2']['deploy']['app_parent']
app_root    = node['mage2']['deploy']['app_root']
docroot     = node['mage2']['docroot'].to_s
deploy_user = node['mage2']['deploy']['user'].to_s
bash_profile = "/home/#{deploy_user}/.bash_profile"

if app_parent.nil? || app_parent.empty?
  raise 'Error: property node[\'mage2\'][\'deploy\'][\'app_root\'] is required and undefined!'
end

execute 'magento cli in PATH' do
  command "echo 'export PATH=\$PATH:#{app_root}/bin # magento-cli-path' >> #{bash_profile}"
  action  :run
  not_if  "grep -F 'magento-cli-path' #{bash_profile}"
  user    deploy_user
end

if node.chef_environment == 'development'
  template 'installing local.xml' do
    path     "#{app_root}/app/etc/local.xml"
    source   'magento/local.xml.erb'
    group    'vagrant'
    owner    'vagrant'
    mode     0644
    backup   false
    action   :create
    only_if  "test -d #{app_root}"
  end

  template 'installing config.php' do
    path     "#{app_root}/app/etc/config.php"
    source   'magento/config.php.erb'
    group    'vagrant'
    owner    'vagrant'
    mode     0644
    backup   false
    action   :create
    only_if  "test -d #{app_root}"
  end

  template 'installing env.php' do
    path     "#{app_root}/app/etc/env.php"
    source   'magento/env.php.erb'
    group    'vagrant'
    owner    'vagrant'
    mode     0644
    backup   false
    action   :create
    only_if  "test -d #{app_root}"
    only_if  "test -d #{app_root}"
  end

end
