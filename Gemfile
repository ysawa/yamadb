source 'http://rubygems.org'

gem 'rails', '3.0.9'
gem 'jquery-rails', '1.0.12'
gem 'haml', '3.1.2'
gem 'haml-rails', '0.3.4'
gem 'sass', '3.1.3'
gem 'amazon-ecs', '2.0.0'

group :development do
  gem 'therubyracer', '0.9.2'
  gem 'barista', '1.2.1'
end unless ENV['VCAP_SERVICES']

gem 'mongo', '1.3.1'
gem 'bson_ext', '1.3.1'
gem 'mongoid', '2.0.0.rc.6'
gem 'kaminari', '~> 0.12.4'
gem 'ya2yaml', '0.30'
gem 'SystemTimer', '1.2.3'

gem 'mini_magick', '3.3'
gem 'twitter', '1.6.0'
gem 'igo-ruby', '~> 0.1.5'

gem 'omniauth', '~> 0.2.6'
gem 'devise', '~> 1.4.2'

gem 'bartt-ssl_requirement', :require => 'ssl_requirement'

group :development, :test do
  gem 'fakeweb', '1.3.0'
  gem 'rspec-rails', '2.6.1'
  gem 'spork', '0.9.0.rc9'
  gem 'capybara', '1.0.0'
  gem 'fabrication', '0.9.5'
  gem 'rb-fsevent', '0.4.0'
  gem 'libnotify', '0.3.0'
  gem 'launchy', '0.4.0'
  gem 'guard-spork', '0.2.0'
  gem 'guard-rspec', '0.2.0'
end unless ENV['VCAP_SERVICES']
