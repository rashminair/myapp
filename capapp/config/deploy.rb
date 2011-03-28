set :application, "capapp"

#github stuff
set :repository,  "git@github.com:rashminair/testrepo.git"
set :scm, :git
set :scm_username, "rashminair"
set :scm_passphrase, "rashmin111"

set :use_sudo,    false
set :deploy_to,   "/rails_apps/#{application}"

#server login
set :user, "root"
set :password, "c3nt0s123"

ssh_options[:forward_agent] = true

# will be different entries for app, web, db if you host them on different servers
 server "180.149.241.115", :app, :web, :db, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end