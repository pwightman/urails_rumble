namespace :users do
  task :destroy_all do
    User.destroy_all
  end
end
