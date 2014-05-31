# config valid only for Capistrano 3.1
lock '3.2.1'

set :use_sudo, false

set :application, 'P4Know'
set :repo_url, 'git@github.com:robinsonj/p4know.git'
set :deploy_via, :remote_cache

# Default deploy_to directory is /var/www/p4know
set :deploy_to, '/var/www/p4know'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 10

set :rvm_type, :system
set :rvm_ruby_version, '2.0.0@p4know'

set :bundle_gemfile, -> { release_path.join('Gemfile') }

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within current_path do
        execute :bundle, "exec thin -C <<thin config>> restart"
      end
    end
  end

  before :restart, 'rvm:hook'
  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
