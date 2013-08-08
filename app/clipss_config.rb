class ClipssConfig
  attr_accessor :env,:log_level,:clipss_file\
  ,:bind ,:port,:logging,:dump_errors

  def initialize()
    @env         = :production
    @log_level   = :warn
    @clipss_file = ENV['CLIPSS_PASS']
    @port        = "8085"
    @bind        = "0.0.0.0"
    @logging     = false
    @dump_errors = false

  end
end
