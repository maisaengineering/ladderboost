source 'https://rubygems.org'
ruby '1.9.3' #for heroku deployment with mongoId
gem 'rails', '3.2.11'


group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "therubyracer", ">= 0.11.3", :platform => :ruby, :require => "v8"
end

group :development do
  gem "html2haml", ">= 1.0.1"
  gem "quiet_assets", ">= 1.0.1"
  gem "better_errors", ">= 0.6.0"
  gem "binding_of_caller", ">= 0.7.1", :platforms => [:mri_19, :rbx]
  gem "hub", ">= 1.10.2", :require => nil

end

group :test do
  gem "launchy", ">= 2.2.0"
  gem "capybara", ">= 2.0.2"
  gem "database_cleaner", ">= 0.9.1"
  gem "mongoid-rspec", ">= 1.6.0"
  gem "email_spec", ">= 1.4.0"
  gem "cucumber-rails", ">= 1.3.0", :require => false
end

group :development,:test do
  gem "rspec-rails", ">= 2.12.2"
  gem "factory_girl_rails", ">= 4.2.0"
end

#jquery specific
gem 'jquery-rails'

#mongoDb specific
gem "mongoid", ">= 3.1.1"
gem "mongoid-paperclip", :require => "mongoid_paperclip"

#Bootstrap specific
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"

gem 'thin'

#Creates a link tag of the given name using a URL created by the set of options.
gem 'active_link_to' #https://github.com/twg/active_link_to
gem 'simple_form'

gem "haml-rails", ">= 0.4"
gem "devise", ">= 2.2.3"
gem "figaro", ">= 0.5.3"
gem "libv8", ">= 3.11.8"
gem 'heroku'


# Creates Fake Data







