class ClipssLog

  attr_accessor :log,:logger,:logger_std

  def self.debug(msg = nil,&block)
    method_loglevel(__method__,caller.first,msg,&block)
  end

  def self.info(msg = nil,&block)
    method_loglevel(__method__,caller.first,msg,&block)
  end

  def self.warn(msg = nil,&block)
    method_loglevel(__method__,caller.first,msg,&block)
  end

  def self.error(msg = nil,&block)
    method_loglevel(__method__,caller.first,msg,&block)
  end

  def self.fatal(msg = nil,&block)
    method_loglevel(__method__,caller.first,msg,&block)
  end

  def self.method_loglevel(level,cal,msg,&block)
    prog = parse_caller(cal)
    log.logger.progname     = prog
    log.logger.send(level,msg,&block)

    if Clipss.config.env == 'development'
      log.logger_std.progname = prog
      log.logger_std.send(level,msg,&block)
    end
  end

  def self.parse_caller(at)
    if /^(.+?):(\d+)(?::in `(.*)')?/ =~ at
      file = $1
      line = $2.to_i
      method = $3
      "#{file}:#{line}:#{method}"
    else
      ""
    end
  end

  def self.log
    @log ||=new
  end

  def logger
    if @logger.nil?
      @logger       = Logger.new("#{APP_ROOT}/log/#{Clipss.config.env}.log",7)
      @logger.level = log_level
    end
    @logger
  end

  def logger_std
    if @logger_std.nil?
      @logger_std   = Logger.new(STDOUT)
      @logger.level = log_level
    end
    @logger_std
  end

  def log_level
    case Clipss.config.log_level
    when :debug
      Logger::DEBUG
    when :info
      Logger::INFO
    when :warn
      Logger::WARN
    else
      Logger::ERROR
    end
  end

end
