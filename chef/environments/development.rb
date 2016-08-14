name "development"
description "overrides and defaults for development"

default_attributes(
  'mage2' => {
    'deploy' => {
      'user'       => 'vagrant',
      'app_parent' => '/vagrant',
      'app_root'   => '/vagrant/vendor/magento/project-community-edition'
    },
    'docroot' => '/vagrant/vendor/magento/project-community-edition/pub',
    'magento' => {
      'db' => {
        'host'        => '192.168.140.20',
        'database'    => 'mage2_development',
        'user'        => 'mage2',
        'password'    => '23hya93hg3v5hg36h43gh388464877f396bc6j77'
      }
    },
    'php' => {
      'ini' => {
        'path'   => '/etc/php.ini',
        'options' => {
        },
      },
      'fpm' => {
        'path'          => '/etc/php-fpm.d/www.conf',
        'listen'        => '/var/run/php-fpm-www.sock',
        'listen_owner'  => 'www-data',
        'listen_group'  => 'www-data',
        'user'          => 'www-data',
        'group'         => 'www-data',
        'max_children'  => 5,
        'start_servers' => 2,
        'min_spare'     => 1,
        'max_spare'     => 3,
        'options' => {
          'php_flag[display_errors]'   => 'on',
          'php_admin_value[error_log]' => '/var/log/php-fpm/www-error.log',
          'php_admin_flag[log_errors]' => 'on',
          'slowlog'                    => '/var/log/php-fpm/www-slow.log',
        },
      },
    },
    'nginx' => {
      'docroot'              => '/vagrant/vendor/magento/project-community-edition/pub',
      'sendfile'             => 'off',
      'hosts' => {
        'dev.mage2-chef.com' => {
          'mage_run_code' => 'base',
          'mage_run_type' => 'website',
          'fastcgi_read_timeout' => '300s',
          'fastcgi_send_timeout' => '300s'
        }
      }
    }
  }
)

override_attributes(
  'mage2' => {
    'nginx' => {
      'www' => {
        'servernames' => ['dev.mage2-chef.com']
      },
      'www-upstream' => {
        'fastcgi_read_timeout'  => '300s',
        'fastcgi_send_timeout'  => '300s',
        'servernames'          => ['dev.mage2-chef.com'],
      }
    }
  }
)