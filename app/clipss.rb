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
