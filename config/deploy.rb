# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"
# set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

# set :sidekiq_processes, 2
# set :sidekiq_options_per_process, ["--queue high", "--queue default --queue low"]


set :application, "farmspot"
set :repo_url, "git@github.com:bananvyhe/farmspot.git"
# set :init_system, :systemd
# set :upstart_service_name, 'sidekiq'
# set :rbenv_map_bins, fetch(:rbenv_map_bins).to_a.concat(%w(sidekiq sidekiqctl))
set :pty,  false
set :rbenv_map_bins, %w{rake gem bundle ruby rails sidekiq sidekiqctl}

SSHKit.config.command_map[:sidekiq] = "bundle exec sidekiq"
SSHKit.config.command_map[:sidekiqctl] = "bundle exec sidekiqctl"

# set :whenever_identifier,   ->{ fetch :application }
#     set :whenever_environment,  ->{ fetch :rails_env, fetch(:stage, "production") }
#         set :whenever_command,      ->{ [:bundle, :exec, :whenever] }

# namespace :sidekiq do
#   task :quiet do
#     on roles(:app) do
#       puts capture("pgrep -f 'sidekiq' | xargs kill -TSTP") 
#     end
#   end
#   task :restart do
#     on roles(:app) do
#       execute :sudo, :initctl, :restart, :workers
#     end
#   end
# end
 
after 'deploy:starting', 'sidekiq:quiet'
after 'deploy:reverted', 'sidekiq:restart'
after 'deploy:published', 'sidekiq:restart'
# after "deploy:updated",  "whenever:update_crontab"
# after "deploy:reverted", "whenever:update_crontab"
# set :init_system, :upstart

# set :sidekiq_monit_use_sudo, true
# set :sidekiq_monit_templates_path, 'config/deploy/templates'
# set :sidekiq_monit_conf_dir, '/etc/monit/conf.d'
# set :monit_bin, '/usr/bin/monit'
# set :sidekiq_monit_default_hooks, true
# set :sidekiq_monit_group, nil

#set :sidekiq_service_name, "sidekiq_#{fetch(:application)}_#{fetch(:sidekiq_env)}" + (index ? "_#{index}" : '')
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
 set :deploy_to, "/home/deploy/apps/farmspot"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
 append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
 append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads"
# role :all, %w{deploy@46.161.39.175}


# set :upstart_service_name, 'sidekiq'

# namespace :sidekiq do
#   task :quiet do
#     on roles(:app) do
#       puts capture("pgrep -f 'sidekiq' | xargs kill -TSTP") 
#     end
#   end
#   task :restart do
#     on roles(:app) do
#       execute :sudo,  :restart, :workers
#     end
#   end
# end

# after 'deploy:starting', 'sidekiq:quiet'
# after 'deploy:reverted', 'sidekiq:restart'
# after 'deploy:published', 'sidekiq:restart'

# If you wish to use Inspeqtor to monitor Sidekiq
# https://github.com/mperham/inspeqtor/wiki/Deployments
# namespace :inspeqtor do
#   task :start do
#     on roles(:app) do
#       execute :inspeqtorctl, :start, :deploy
#     end
#   end
#   task :finish do
#     on roles(:app) do
#       execute :inspeqtorctl, :finish, :deploy
#     end
#   end
# end

# before 'deploy:starting', 'inspeqtor:start'
# after 'deploy:finished', 'inspeqtor:finish'
#set :upstart_service_name, 'sidekiq'
#set :pty,  false


set :MALLOC_ARENA_MAX, 2

# set :sidekiq_processes, 2
# set :sidekiq_options_per_process, ["--queue high", "--queue default --queue low"]
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
