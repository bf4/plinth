$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'deploy')
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

require "bundler/capistrano"
load 'deploy/assets'

set :default_environment, {
    'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

# Securly manage database.yml file
# For more informaiton please see:
# https://gist.github.com/2781737
# require "/Users/vincent/projects/rails/thebeansgroup/lib/capistrano/tasks/capistrano_database"
require "aws_ec2"


set :application, "sb-styleguide"
set :repository,  "git@github.com:thebeansgroup/sb-styleguide.git"

set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_via, :remote_cache

set :user, "staging"
set :deploy_to, "/var/www/apps/#{application}"

# set :location, "deploy.thebeansgroup.com"
# role :web, location                      # Your HTTP server, Apache/etc
# role :app, location                      # This may be the same as your `Web` server
# role :db,  location, :primary => true    # This is where Rails migrations will run
# role :db,  "your slave db-server here"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:auth_methods] = ["publickey"]

set :rvm_type, :system

task :production do
  raise "There is currently no production destination for the #{application}, try staging"
end

task :staging do
  if exists?("compile") and compile == "local"
    namespace :deploy do
      namespace :assets do
        task :precompile, :roles => :web do
          from = source.next_revision(current_revision)
          logger.info "Compiling assets locally"
          run_locally("RAILS_ENV=#{rails_env} rake assets:clean && RAILS_ENV=#{rails_env} rake assets:precompile")
          logger.info "Preparing locally compiled assets for upload"
          run_locally "cd public && tar -jcf assets.tar.bz2 assets"
          logger.info "Uploading assets"
          top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
          logger.info "Preparing uploaded assets"
          run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
          logger.info "Cleaning up after assets upload"
          run_locally "rm public/assets.tar.bz2"
          # run_locally("RAILS_ENV=#{rails_env} rake assets:clean")
        end

        task :symlink, roles: :web do
          run ("rm -rf #{latest_release}/public/assets &&
            mkdir -p #{latest_release}/public &&
            mkdir -p #{shared_path}/assets &&
            ln -s #{shared_path}/assets #{latest_release}/public/assets")
        end
      end
    end
  end


  set :branch, exists?("branch") ? branch : "develop"
  set :rails_env, "staging"
  ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "staging.pem")]
  aws_ec2_role :web, :region => "eu-west-1", :tags => {:Name => "staging"}
  aws_ec2_role :app, :region => "eu-west-1", :tags => {:Name => "staging"}
end

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# We need to trust the rvmrc file once the new dir has been created
# and populated
after "deploy:update_code", "rvm:trust_rvmrc"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :rvm do
  desc 'Trust rvmrc file'
  task :trust_rvmrc do
    run "rvm rvmrc trust #{current_release}"
  end
end

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

