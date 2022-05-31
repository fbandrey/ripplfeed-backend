lock '3.8.2'

set :application, 'ripplfeed'
set :repo_url, 'git@bitbucket.org:fbandrey/ubot-rails.git'

set :rvm_type, :system
set :rvm_ruby_version, '2.4.1@ripplfeed'

set :deploy_to, "/srv/www/#{fetch(:application)}"
set :default_shell, '/bin/bash -l'
set :pty, true
set :keep_releases, 5

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}

# === Tasks ===
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
  after :finishing, :cleanup
  after :publishing, :restart
  after :finished, 'sidekiq:restart'
end

namespace :unicorn do
  %w(stop start restart).each do |action|
    desc "#{action} Unicorn"
    task action do
      on roles(:app) do
        execute :sudo, "/bin/systemctl #{action} unicorn@ripplfeed.service"
      end
    end
  end
end

namespace :sidekiq do
  %w(stop start restart).each do |action|
    desc "#{action} Sidekiq"
    task action do
      on roles(:app) do
        execute :sudo, "/bin/systemctl #{action} sidekiq-ripplfeed.service"
      end
    end
  end
end
