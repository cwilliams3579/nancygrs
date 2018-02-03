source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'
gem 'rails', '~> 5.1.4'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'figaro'
gem 'actionmailer'
gem 'rack-cors', :require => 'rack/cors'
gem "brakeman", :require => false
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'

# gem 'capistrano-rails', group: :development
group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'acts_as_votable', '~> 0.10.0'
gem 'bootstrap', '~> 4.0'
gem 'devise'
gem 'high_voltage'
gem 'ratyrate'
gem 'kaminari'


source "https://rails-assets.org" do
  gem "rails-assets-tether"
end

group :development do
  gem 'better_errors'
  gem 'hirb'
  gem 'hub', :require=>nil
  gem 'rails_apps_pages'
  gem 'rails_layout'
end
