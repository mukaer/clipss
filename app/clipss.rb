# Clipss
module Clipss
  attr_accessor :config

  def configure(&block)
    instance_eval(&block)
  end

  def config
    @config ||= Clipss::Config.new
  end

  module_function :configure , :config
end
