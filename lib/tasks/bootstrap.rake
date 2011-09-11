namespace :bootstrap do
  desc "Add the default roles"
  task :default_roles => :environment do
    Role.create( :name => 'admin' )
  end

  desc "Run all bootstrapping tasks"
  task :all => [:default_roles]
end
