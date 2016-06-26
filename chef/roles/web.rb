name 'web'
description 'Make sure the node smells like a web box'

run_list(
  'recipe[xer-web]',
)

default_attributes(
  'mage2' => {
    'packages' => [
      'gnupg',
      'mariadb', # provides client libraries
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