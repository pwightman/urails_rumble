namespace :users do
  task :destroy_all => :environment do
    User.destroy_all
  end
end
