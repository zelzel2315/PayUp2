source 'https://rubygems.org'
gem 'rails_12factor'
gem 'rails', '4.0.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'httparty'
gem 'workflow'


#for angularjs to work nicely on rails
gem 'angularjs-rails' 
gem 'angular-rails-templates'

#for json APIs
gem 'active_model_serializers'

# debugging tools
group :development do
  gem 'meta_request' #rails inspector
  gem "better_errors" #rails errorpage
  gem "binding_of_caller" #rails errorpage
end

# testing
group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'guard-rspec', require: false #automatic rspec runner
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem "jasmine", github: "pivotal/jasmine-gem" #js testing
end