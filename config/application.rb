APP||=:cli
APP_ROOT||= File.expand_path "../../" ,__FILE__

module Clipss
  # ruby default
  require 'pp'
  require 'logger'
  require 'monitor'
  require 'timeout'
  require 'uri'
  require 'httpclient'
  require 'open3'
  require 'clipboard'


  # app
  $LOAD_PATH.unshift  "#{APP_ROOT}/app"
  require "#{APP_ROOT}/app/clipss"

#  require "#{APP_ROOT}/config/config.rb"  if File.file? "#{APP_ROOT}/config/config.rb"
#  require "#{APP_ROOT}/config/env.rb"
 
  #conf
  if APP == :httpd
    ENV["RACK_ENV"] ||= Clipss.config.env.to_s
    require 'sinatra/base'
    require 'sinatra/reloader' if Clipss.config.env == :development
    require 'slim'
#    require "#{APP_ROOT}/app/clipss_httpd"
  end
 
end

