source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11'
gem "nokogiri", "~> 1.13.4"
gem "pg", "~> 1.0.0"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.7'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 4.1.10'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.2.2'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.4'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5.1.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.6.4'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 1.0.0', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


group :test, :development do
  gem 'rspec-rails', "~> 3.7.2"
end

group :test do
  gem 'capybara', "2.18.0"
  gem "factory_girl_rails", "~> 4.9.0"
  gem "pry", '~> 0.11.3'
end

group :development do
  gem "spork-rails", github: 'sporkrb/spork-rails'
  gem "guard-rspec", "~> 4.7.3"
  gem "guard-spork", "~> 2.1.0"
end
