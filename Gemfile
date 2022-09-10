source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.4'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'propshaft'
gem 'puma', '~> 5.0'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Database
gem 'pg', '~> 1.1'

# Authentication
gem 'devise'

# Files attachments
gem 'carrierwave', '~> 2.0'
# Image processing
gem 'image_processing', '~> 1.2'

# Pagination
gem 'pagy', '~> 5.10'

group :development, :test do
  # Debugging
  gem 'pry-byebug'
  gem 'pry-rails'

  # Testing
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 5.0'

  # Generate fake data
  gem 'ffaker'
end

group :development do
  gem 'web-console'
end
