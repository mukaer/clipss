source "https://rubygems.org"

if RUBY_PLATFORM.match(/mswin|mingw/i)
  gem "ffi"
end

gem "sinatra"
gem "sinatra-contrib"    , :group => [:development]
gem "slim"
gem "httpclient"
gem "clipboard"

group :development do
  gem "rspec"
  gem "rspec-expectations"
  gem "rack-test"
  gem "nokogiri"
  gem "webmock"
  gem "rubocop"
end
