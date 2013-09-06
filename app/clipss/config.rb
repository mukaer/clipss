# Clipss
module Clipss
  # Config
  class Config
    attr_accessor(:env ,
                  :log_level ,
                  :clipss_file ,
                  :bind ,
                  :port ,
                  :logging ,
                  :dump_errors ,
                  :remote_svs
                  )

    def initialize
      @env         = :production
      @log_level   = :warn
      @clipss_file = ENV['CLIPSS_FILE']
      @port        = ENV['CLIPSS_PORT'] || '9116'
      @bind        = '0.0.0.0'
      @logging     = false
      @dump_errors = false
      svs = ENV['CLIPSS_REMOTE_SV']
      @remote_svs  = svs.nil? ?  [] : svs.split(' ')

    end
  end
end
