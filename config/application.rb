APP      ||= :cli
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

  # init
  $LOAD_PATH.unshift  "#{APP_ROOT}/app"
  require 'clipss'
  require 'clipss/config'

  # config
  app_config = "#{APP_ROOT}/config"
  $LOAD_PATH.unshift  app_config
  require 'config.rb' if File.file?("#{app_config}/config.rb") && APP != :spec
  require 'env.rb'

  # lib
  require 'clipss/log'
  require 'clipss/timediff'
  require 'clipss/os'
  require 'clipss/converter'

  # var
  require 'clipss/var'
  require 'clipss/var/all'
  require 'clipss/var/cs_file'
  require 'clipss/var/clipboard'
  require 'clipss/var/remote_svs'
  require 'clipss/var/history'

  require 'clipss/cmd'

  require 'clipss/clipboard_watcher'

  env = Clipss.config.env
  if APP == :httpd || APP == :spec
    ENV['RACK_ENV'] ||= env.to_s
    require 'sinatra/base'
    require 'sinatra/reloader' if env == :development
    require 'nokogiri'         if env.to_s.match(/development|test/)
    require 'rack/test'        if env.to_s.match(/development|test/)
    require 'slim'
    require 'clipss/httpd'
  end

  if env == :development
    require 'pry'
    require 'pry-doc'
    require 'debugger/pry'
  end
end
