source 'https://rubygems.org'
ruby '2.1.2'

group :development, :test do
  gem 'rake',        '10.3.2'
  gem 'rspec',       '3.1.0'
  gem 'guard-rspec', '4.3.1'

  case RUBY_PLATFORM
  when /darwin13/
    gem 'rspec-nc', '0.2.0' # OS X mavericks notifications
  end
end
