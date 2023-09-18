source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 6.1.7', '>= 6.1.7.4'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'rack-cors', :require => 'rack/cors'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails', require: 'dotenv/rails-now'

group :development, :test do

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem "letter_opener", "~> 1.8"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "dockerfile-rails", ">= 1.5", :group => :development

gem "devise_token_auth", "~> 1.2"


gem "kaminari", "~> 1.2"
