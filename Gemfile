source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'

gem 'rails',                        '~> 5.1.2'
gem 'pg',                           '~> 0.21.0'
gem 'active_model_serializers',     '~> 0.10.6'
gem 'state_machines-activerecord',  '~> 0.5.0'
gem 'seedbank',                     '~> 0.4.0'
gem 'searchlight',                  '~> 4.1.0'

# --- Environment ---
gem 'dotenv-rails',                 '~> 2.2.1'

# --- Background jobs ---
gem 'sidekiq',                      '~> 5.0.4'
gem 'redis',                        '~> 3.3.3'
gem 'redis-namespace',              '~> 1.5.3'

# --- Third-party services ---
gem 'aws-sdk',                      '~> 2.10.19'

# --- Authentication and authorization ---
gem 'bcrypt',                       '~> 3.1.11'
gem 'jwt',                          '~> 2.0.0.beta1'
gem 'rack-cors',                    '~> 0.4.1', require: 'rack/cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'rspec-rails',                '~> 3.6.0'
  gem 'faker',                      '~> 1.8.4'
  gem 'factory_girl_rails',         '~> 4.8.0'
  gem 'database_cleaner',           '~> 1.6.1'
end

group :development do
  gem 'puma',                       '~> 3.7'
  gem 'listen',                     '>= 3.0.5', '< 3.2'
  gem 'capistrano-rails',           '~> 1.3.0'
  gem 'capistrano-rvm',             '~> 0.1.2'
end

group :production do
  gem 'unicorn',                    '5.0.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
