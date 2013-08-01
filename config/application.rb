class Clipss

  # ruby default
  require 'pp'
  require 'logger'

  #lib
  require "#{APP_ROOT}/lib/timediff"

  # gem
  TimeDiff.now(:req_gem1)
#  require 'active_support/core_ext'
  TimeDiff.now(:req_gem2)
#  require 'httpclient'
  TimeDiff.now(:req_gem3)

  TimeDiff.now(:req_app1)
  # app
  require "#{APP_ROOT}/app/clipss"
  require "#{APP_ROOT}/app/clipss_config"
  require "#{APP_ROOT}/config/config.rb"  if File.file? "#{APP_ROOT}/config/config.rb"
  require "#{APP_ROOT}/config/env.rb"

  require "#{APP_ROOT}/app/log"
  require "#{APP_ROOT}/app/push"
  require "#{APP_ROOT}/app/pop"



  TimeDiff.now(:req_app2)
  #conf



  TimeDiff.now(:req_app3)

end
