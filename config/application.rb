APP||=:cli
APP_ROOT||= File.expand_path "../../" ,__FILE__

module Clipss
  # gems
  require 'pp'
  require 'logger'
  require 'uri'
  require 'httpclient'
  require 'open3'
  require 'clipboard'
  require 'monitor'
  require 'timeout'  

  # app
  $LOAD_PATH.unshift  "#{APP_ROOT}/app"
  require "clipss"
  require "clipss/config"  
  require "clipss/log"
  require "clipss/timediff"
   
  require "clipss/clipboard"
  #require "clipss/file"
  #require "clipss/httpclient"
  #require "clipss/push"
  #require "clipss/push_rsv"
  #require "clipss/pop"

  # config
  $LOAD_PATH.unshift  "#{APP_ROOT}/config"  
  require "config.rb"  if File.file? "#{APP_ROOT}/config/config.rb"
  require "env.rb"
 
  #conf
  if APP == :httpd
    ENV["RACK_ENV"] ||= Clipss.config.env.to_s
    require 'sinatra/base'
    require 'sinatra/reloader' if Clipss.config.env == :development
    require 'slim'
#    require "clipss/httpd"
  end

end
