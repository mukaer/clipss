APP ||= :cli
APP_ROOT ||= File.expand_path '../../', __FILE__

# Clipss require
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


  $LOAD_PATH.unshift  "#{APP_ROOT}/app"
  require 'clipss'
  require 'clipss/config'

  # config
  $LOAD_PATH.unshift  "#{APP_ROOT}/config"
  require 'config.rb'  if File.file? "#{APP_ROOT}/config/config.rb"
  require 'env.rb'

  require 'clipss/log'
  require 'clipss/timediff'
  require 'clipss/os'

  require 'clipss/var'
  require 'clipss/var/all'
  require 'clipss/var/cs_file'
  require 'clipss/var/clipboard'
  require 'clipss/var/remote_svs'
  require 'clipss/var/history'

  require 'clipss/cmd'

  require 'clipss/clipboard_watcher'

  if APP == :httpd
    env = Clipss.config.env
    ENV['RACK_ENV'] ||= env.to_s
    require 'sinatra/base'
    require 'sinatra/reloader' if env == :development
    require 'nokogiri'         if env.to_s.match(/development|test/)
    require 'rack/test'        if env.to_s.match(/development|test/)
    require 'slim'
    require 'clipss/httpd'
  end

end
