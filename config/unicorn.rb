# Paths
app_path = '/srv/www/ripplfeed'
working_directory "#{app_path}/current"
pid "#{app_path}/shared/pids/unicorn.pid"

# Listen
listen "#{app_path}/shared/unicorn.sock", backlog: 64

# Logging
stderr_path 'log/unicorn.err.log'
stdout_path 'log/unicorn.out.log'

# Workers
worker_processes 1

# Use correct Gemfile on restarts
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{working_directory}/Gemfile"
end

# Preload
preload_app true

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
