class ClipssConfig
  attr_accessor :env,:log_level,:clipss_file
  def initialize()
    @env         = 'prodction'
    @log_level   = 'warn'
    @clipss_file = ENV['CLIPSS_PASS']

  end
end
