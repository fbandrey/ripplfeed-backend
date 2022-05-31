role :app, %w{deployer@176.9.92.147}
role :web, %w{deployer@176.9.92.147}
role :db,  %w{deployer@176.9.92.147}

set :stage, :production
set :branch, ENV['branch'] || 'master'
set :rails_env, :production

server '176.9.92.147', user: 'deployer', roles: %w{web app db}, primary: true # my_property: :my_value
