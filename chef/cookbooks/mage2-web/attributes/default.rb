default['mage2']['docroot'] = '/vagrant/pub'

# deploy defaults
default['mage2']['deploy']['user'] = 'vagrant'
default['mage2']['deploy']['app_parent'] = '/vagrant'
default['mage2']['deploy']['app_root'] = '/vagrant'

# magento defaults
default['mage2']['magento']['db']['host'] = '192.168.140.20'
default['mage2']['magento']['db']['database'] = 'mage2_development'
default['mage2']['magento']['db']['user'] = 'mage2'
default['mage2']['magento']['db']['password'] = '23hya93hg3v5hg36h43gh388464877f396bc6j77'

# php defaults
default['mage2']['php']['ini']['path'] = '/etc/php.ini'
default['mage2']['php']['fpm']['options']['php_flag[display_errors]'] = 'on'
default['mage2']['php']['fpm']['options']['php_admin_value[error_log]'] = '/var/log/php-fpm/www-error.log'
default['mage2']['php']['fpm']['options']['slowlog'] = '/var/log/php-fpm/www-slow.log'
default['mage2']['php']['fpm']['path'] = '/etc/php-fpm.d/www.conf'
default['mage2']['php']['fpm']['listen'] = '/var/run/php-fpm-www.sock'
default['mage2']['php']['fpm']['listen_owner'] = 'www-data'
default['mage2']['php']['fpm']['listen_group'] = 'www-data'
default['mage2']['php']['fpm']['user'] = 'www-data'
default['mage2']['php']['fpm']['group'] = 'www-data'
default['mage2']['php']['fpm']['max_children'] = '5'
default['mage2']['php']['fpm']['start_servers'] = '2'
default['mage2']['php']['fpm']['min_spare'] = '1'
default['mage2']['php']['fpm']['max_spare'] = '3'

# nginx defaults
default['mage2']['nginx']['docroot'] = '/vagrant/pub'
default['mage2']['nginx']['sendfile'] = 'off'
default['mage2']['nginx']['hosts'] = [
    'dev.mage2-chef.com' => {
        'mage_run_code' => 'base',
        'mage_run_type' => 'website',
        'fastcgi_read_timeout' => '300s',
        'fastcgi_send_timeout' => '300s'
    }
]