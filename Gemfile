# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.1.1'
gem 'rails', '~> 7.1.3'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rswag-api'
gem 'rswag-ui'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'bootsnap', require: false
gem 'rack-cors'
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3'
  gem 'ffaker', '~> 2.23'
  gem 'rspec', '~> 3.13'
  gem 'rswag-specs', '~> 2.13'
  gem 'rubocop', '~> 1.60', '>= 1.60.2', require: false
end

group :test do
  gem 'simplecov', '~> 0.22.0', require: false
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  # gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end
