# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'interactor', '~> 3.1', '>= 3.1.2'
gem 'jsonapi-serializer', '~> 2.2'
gem 'jwt_sessions', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'redis', '~> 4.5', '>= 4.5.1'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.2'
  gem 'ffaker', '~> 2.20.0'
  gem 'rubocop', '~> 1.23', require: false
  gem 'rubocop-performance', '~> 1.12', require: false
  gem 'rubocop-rails', '~> 2.12', '>= 2.12.4', require: false
  gem 'rubocop-rspec', '~> 2.6', require: false
end

group :development do
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  gem 'brakeman', '~> 5.1', '>= 5.1.2'
  gem 'bundle-audit', '~> 0.1.0'
  gem 'fasterer', '~> 0.9.0'
  gem 'lefthook', '~> 0.7.7'
  gem 'listen', '~> 3.3'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'spring'
end

group :test do
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
end
