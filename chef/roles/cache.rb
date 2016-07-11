name 'cache'
description 'cached data'

run_list(
  'recipe[redisio]',
  'recipe[redisio::enable]'
)

default_attributes(
  'redisio' => {
    'default_settings' => {
      'address' => '0.0.0.0',
      'datadir' => '/mnt/redis/'
    },
    'servers' => [
      {'port' => '6379'},
      {'port' => '6380'},
      {'port' => '6381'},
    ]
  }
)