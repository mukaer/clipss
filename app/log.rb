class ClipssLog
  attr_accessor :log

  def self.debug(msg)
    log.debug(msg)
  end

  def self.info(msg)
    log.info(msg)
  end

  def self.warn(msg)
    log.warn(msg)
  end

  def self.error(msg)
    log.error(msg)
  end

  def self.fatal(msg)
    log.fatal
  end

  def self.log
    if @log.nil?
      @log       = Logger.new("#{APP_ROOT}/log/#{Clipss.config.env}.log",7)
      @log.level = log_level
    end
    @log
  end

  def self.log_level
    case Clipss.config.log_level
    when 'debug'
      Logger::DEBUG
    when 'info'
      Logger::INFO
    when 'warn'
      Logger::WARN
    else
      Logger::ERROR
    end
  end
end
