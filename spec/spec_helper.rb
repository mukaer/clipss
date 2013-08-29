require 'webmock/rspec'
WebMock.allow_net_connect!

APP = :spec
APP_ROOT = File.expand_path "../../" ,__FILE__
require "#{APP_ROOT}/config/application"

EX_URL = "www.example.com"
EX_URL_REG = /.*example.*/
