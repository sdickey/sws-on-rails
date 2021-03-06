source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

gem 'bcrypt-ruby', require: "bcrypt"

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'


# Use SCSS for stylesheets

gem 'sass-rails', '~> 4.0.0'

gem 'bootstrap-sass', '~> 3.2.0'

gem 'autoprefixer-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# delayed job for background jobs
gem 'delayed_job_active_record'

# for running delayed job in production
gem 'daemons'

# web interface for managing job queue
gem 'delayed_job_web'

# gem 'therubyracer'

# gem 'less'

# gem 'less-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# gem for displaying calendar
gem 'fullcalendar-rails', '~> 1.6.4.0'

# Gems for sending reservation emails
gem 'mail_form', '~> 1.5.0'
gem 'simple_form', '~> 3.0.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-sass-rails', '~> 4.0.3.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
group :development, :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.4.0'
  gem 'sqlite3'
end

group :production do
  gem 'pg', '~> 0.17.1'
  gem 'rails_12factor', '~> 0.0.2'
  gem 'unicorn'
end

group :test do
  gem 'faker', '~> 1.4.3'
  gem 'capybara', '~> 2.4.2'
  gem 'database_cleaner', '~> 1.3.0'
  gem 'launchy', '~> 2.4.2'
  gem 'selenium-webdriver', '~> 2.43.0'
  gem 'rspec-collection_matchers'
  gem 'shoulda-matchers', require: false
end