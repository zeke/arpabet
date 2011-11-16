source 'http://rubygems.org'

gem 'jquery-rails'
gem 'rails', '3.1.1'
gem 'mysql2'

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem "rspec-rails", "~> 2.6"
  gem 'factory_girl_rails'
  gem 'autotest', '~>4.4.6'
  gem 'autotest-rails-pure', '~>4.1.2'
  gem 'autotest-growl', '~>0.2.16'
  gem 'autotest-fsevent', '~>0.2.7', :require => false unless RUBY_PLATFORM =~ /darwin/i
end