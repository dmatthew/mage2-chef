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
                'php7.0-json',
                'php7.0-curl',
                'php7.0-zip'
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
        },
        'magento' => {
            'backend' => {
                'frontname' => 'admin'
            },
            'install' => {
                'date' => 'Sun, 20 Mar 2016 03:46:34 +0000'
            },
            'crypt' => {
                'key' => '6a77d7f54f8b7271ff54f434e4402dec'
            },
            'session' => {
                'save' => 'files'
            },
            'db' => {
                'table_prefix' => '',
                'connection' => {
                    'default' => {
                        'host' => '192.168.140.20',
                        'dbname' => 'mage2_development',
                        'username' => 'mage2',
                        'password' => 'hg7549331581ae9b84hfa4f84648785jf61bdmb9',
                        'active' => '1',
                    }
                }
            },
            'resource' => {
                'default_setup' => {
                    'connection' => 'default'
                }
            },
            'x-frame-options' => 'SAMEORIGIN',
            'MAGE_MODE' => 'developer',
            'cache_types' => {
                'config' => 1,
                'layout' => 1,
                'block_html' => 1,
                'collections' => 1,
                'reflection' => 1,
                'db_ddl' => 1,
                'eav' => 1,
                'config_integration' => 1,
                'config_integration_api' => 1,
                'full_page' => 1,
                'translate' => 1,
                'config_webservice' => 1,
            }
        }
    }
)