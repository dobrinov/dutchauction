require 'puma/capistrano'

set :application, "dutchauction"

role :web, "91.230.195.131"
role :app, "91.230.195.131"
role :db,  "91.230.195.131", :primary => true

set :user, "deyan"
# set :password, "certificate"

set :scm, "git"
set :repository, "git@github.com:dobrinov/#{application}.git"
set :branch, "master"

set :scm_username, "dobrinov"
# set :scm_password, "certificate"

set :application_root, "/home/#{user}/apps/#{application}"
set :deploy_to,        "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

ssh_options[:forward_agent] = true
default_run_options[:shell] = '/bin/bash --login'
default_run_options[:pty] = true

namespace :nginx do
  %w[start stop restart].each do |command|
    desc "#{command} nginx"
    task command, roles: :web do
      run "#{sudo} service nginx #{command}"
    end
  end
end