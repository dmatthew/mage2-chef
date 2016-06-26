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
        'servernames' => %w{dev.mage2-chef.com _}
      },
      'www-upstream' => {
        'fastcgi_read_timeout'  => '300s',
        'fastcgi_send_timeout'  => '300s',
        'servernames'          => %w(dev.mage2-chef.com),
      }
    }
  }
)