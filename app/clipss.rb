class Clipss
  def self.configure(&block)
    instance_eval(&block)    
  end

  def self.config
    @config ||= ClipssConfig.new
  end
  
end
