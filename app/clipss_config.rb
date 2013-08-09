class ClipssConfig
  attr_accessor :env,:log_level,:clipss_file\
  ,:bind ,:port,:logging,:dump_errors \
  ,:remote_svs

  def initialize()
    @env         = :production
    @log_level   = :warn
    @clipss_file = ENV['CLIPSS_PASS']
    @port        = ENV['CLIPSS_PORT'] || "9116"
    @bind        = "0.0.0.0"
    @logging     = false
    @dump_errors = false
    @remote_svs  = ENV['CLIPSS_REMOTE_SV'].nil? ?   [] : ENV['CLIPSS_REMOTE_SV'].split(" ")

  end
end
