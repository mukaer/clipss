APP||=:cli
APP_ROOT||= File.expand_path "../../" ,__FILE__

module Clipss
  # ruby default
  require 'pp'
  require 'logger'
  require 'monitor'
  require 'timeout'

  require "#{APP_ROOT}/app/timediff"

  TimeDiff.now(:req_gem1)
#  require 'active_support/core_ext'
  TimeDiff.now(:req_gem2)
  require 'uri'
  require 'httpclient'
  TimeDiff.now(:req_gem3)
  require 'open3'
  require 'clipboard'
  TimeDiff.now(:req_app1)

  # app
  $LOAD_PATH.unshift  "#{APP_ROOT}/app"
#  $LOAD_PATH.unshift  "#{APP_ROOT}/spec"  
  require "#{APP_ROOT}/app/clipss"



#  require "#{APP_ROOT}/config/config.rb"  if File.file? "#{APP_ROOT}/config/config.rb"
#  require "#{APP_ROOT}/config/env.rb"



  TimeDiff.now(:req_app2)
  #conf

  if APP == :httpd
    ENV["RACK_ENV"] ||= Clipss.config.env.to_s
    require 'sinatra/base'
    require 'sinatra/reloader' if Clipss.config.env == :development
    require 'slim'
    require "#{APP_ROOT}/app/clipss_httpd"
  end

  TimeDiff.now(:req_app3)

end

