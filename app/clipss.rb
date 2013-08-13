require "clipss/config"  
require "clipss/log"
#require "clipss/clipboard"
#require "clipss/file"
#require "clipss/httpclient"  
#require "clipss/push"
#require "clipss/push_rsv"
#require "clipss/pop"
#require "clipss/timediff"

module Clipss
  extend self
  attr_accessor :config

  def configure(&block)
    instance_eval(&block)
  end

  def config
    @config ||= Clipss::Config.new
  end
end
