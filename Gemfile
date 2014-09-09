source 'https://rubygems.org'
ruby '2.1.2'

group :development, :test do
  gem 'guard-rspec'

  case RUBY_PLATFORM
  when /darwin/
    # OS X notifications
    gem 'rspec-nc'
    # rspec-nc using deprecated formatters in rspec 3
    gem 'rspec-legacy_formatters'
  end
end
