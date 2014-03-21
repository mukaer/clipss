source 'https://rubygems.org'

gem 'ffi' if RUBY_PLATFORM.match(/mswin|mingw/i)

gem 'sinatra'
gem 'sinatra-contrib' , group: [:development]
gem 'slim'
gem 'httpclient'
gem 'clipboard'

# httpd
gem 'thin' if RbConfig::CONFIG['host_os'].match(/mac|darwin|linux|bsd|cygwin/)

group :development , :test do
  gem 'rake'
  gem 'rspec'
  gem 'rspec-expectations'
  gem 'rack-test'
  gem 'nokogiri'
  gem 'webmock'
  gem 'rubocop'
  gem 'pry'
  gem 'pry-doc'
  gem 'debugger-pry',  require: 'debugger/pry'
end
