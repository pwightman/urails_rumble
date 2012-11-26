source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'activeadmin'
gem 'therubyracer'
gem 'haml'
gem 'omniauth'
gem 'omniauth-github', :git => 'git://github.com/intridea/omniauth-github.git'
gem "twitter-bootstrap-rails"
gem 'jquery-rails'
gem "mocha", :group => :test, :require => false

group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
  gem 'quiet_assets'
  gem 'nifty-generators'
  gem 'rb-fsevent'
  gem 'guard-livereload'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'spork'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
