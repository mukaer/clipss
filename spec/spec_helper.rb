require 'webmock/rspec'
WebMock.allow_net_connect!

APP_ROOT = File.expand_path "../../" ,__FILE__
require "#{APP_ROOT}/config/application"

Clipss.configure do
  config.env         = :test
  config.log_level   = :info
  config.clipss_file = ENV["CLIPSS_FILE"]
  config.remote_svs =  ["http://www.example.com:9116",
                           "http://www.example.com:9117"]
end

EX_URL = "www.example.com"
EX_URL_REG = /.*example.*/

