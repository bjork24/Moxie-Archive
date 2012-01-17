require "bundler/capistrano"

set :application, "danchilton.com"

set :port, 2424
set :ssh_options, { :forward_agent => true }

# Deploy from your local Git repo by cloning and uploading a tarball
set :scm, :git
set :repository,  "."
set :deploy_via, :copy

set :user, :deploy
set :deploy_to, "/var/www/moxie_blog"
set :use_sudo, false

role :web, application
role :app, application
role :db,  application, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :build_share_links do
    run "ln -s #{shared_path}/pix #{release_path}/public/pix"
  end
end

namespace :custom do
  task :build_share_links do
    run "ln -s #{shared_path}/pix #{release_path}/public/pix"
  end
end

after "deploy:restart", "deploy:cleanup"
after "deploy:restart", "custom:build_share_links"