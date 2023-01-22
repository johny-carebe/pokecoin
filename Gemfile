# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby                   '3.1.3'
gem 'rails',           '7.0.4.1'

gem 'importmap-rails'
gem 'jbuilder'
gem 'pg',              '~> 1.1'
gem 'puma',            '~> 5.0'
gem 'rubocop-rails', require: false
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'simplecov', require: false
end
