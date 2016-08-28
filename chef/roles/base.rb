name 'base'

run_list(
    'recipe[mage2-base]',
)

default_attributes(
    'mage2' => {
        'packages' => [
            'build-essential',
            'curl',
            'git',
            'gcc',
            'gnupg',
            'htop',
            'lsof',
            'lvm2',
            'make',
            'ntp',
            'openssh-server',
            'openssl',
            'pv',
            'ssmtp',
            'strace',
            'tmux',
            'unzip',
            'vim',
        ],
        'uninstall' => [
            'apparmor',
            'puppet',
        ]
    },
)
