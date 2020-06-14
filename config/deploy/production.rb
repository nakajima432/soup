server '18.180.144.222', user: 'takumi', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/app_ssh_key'