class Clipss
  attr_accessor :config

  def self.configure(&block)
    instance_eval(&block)
  end

  def self.config
    @config ||= ClipssConfig.new
  end

  def config
    @config ||= ClipssConfig.new
  end
end
