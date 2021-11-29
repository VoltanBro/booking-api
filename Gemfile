# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

group :development, :test do
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
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
