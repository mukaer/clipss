APP||=:cli

class Clipss
  # ruby default
  require 'pp'
  require 'logger'

  require "#{APP_ROOT}/app/timediff"  

  TimeDiff.now(:req_gem1)
#  require 'active_support/core_ext'
  TimeDiff.now(:req_gem2)
  require 'uri'  
  require 'httpclient'
  TimeDiff.now(:req_gem3)

  TimeDiff.now(:req_app1)
  
  # app
  require "#{APP_ROOT}/app/clipss"
  require "#{APP_ROOT}/app/clipss_config"
  
  require "#{APP_ROOT}/config/config.rb"  if File.file? "#{APP_ROOT}/config/config.rb"
  require "#{APP_ROOT}/config/env.rb"

  require "#{APP_ROOT}/app/clipss_log"
  require "#{APP_ROOT}/app/file_base"  
  require "#{APP_ROOT}/app/push"
  require "#{APP_ROOT}/app/pop"
 
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
