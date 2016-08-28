name 'web'
description 'Make sure the node smells like a web box'

run_list(
  'recipe[mage2-web]',
)

default_attributes(
  'mage2' => {
    'php' => {
      'packages' => [
        'php7.0',
        'php7.0-common',
        'php7.0-bcmath',
        'php7.0-fpm',
        'php7.0-cli',
        'php7.0-gd',
        'php7.0-gmp',
        'php7.0-imap',
        'php7.0-intl',
        'php7.0-mbstring',
        'php7.0-mcrypt',
        'php7.0-mysql',
        'php7.0-opcache',
        'php7.0-pdo',
        'php7.0-soap',
        'php7.0-xml',
        'php-xdebug',
        'php7.0-json'
      ]
    },
    'packages' => [
      'gnupg',
      'nginx'
    ],
    'nginx' => {
      'www' => {
        'log_file'             => 'mage2-chef',
        'sendfile'             => 'off',
        'mage_run_code'        => 'base',
        'mage_run_type'        => 'website',
        'fastcgi_read_timeout' => '60s',
        'fastcgi_send_timeout' => '60s'
      }
    }
  }
)