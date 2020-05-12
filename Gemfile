source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Native rails-6 gems
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

# My Gems
gem 'leo_mp3_parser', git: 'git@github.com:Netznarkose/LeoMp3Parser.git', branch: 'master'
gem 'simple_form'
gem 'clipboard-rails'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'spring'
  gem 'rspec-rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
end

group :test do
  gem 'capybara'
  gem 'launchy'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
