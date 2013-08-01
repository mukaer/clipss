class ClipssConfig
  attr_accessor :log_level,:clipss_file
  def initialize()
    @log_level = 'warn'
    @clipss_file = ENV['CLIPSS_PASS']

  end
end
