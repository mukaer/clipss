class Pop

  def self.run
    runner = new
    runner.read_file
    print runner.get_data
  end

  def get_data
    ClipssLog.debug("get_data")
    @data
  end

  def set_data(data)
    ClipssLog.debug("set_data"){ @data }
    @data ||=  data
  end
  
  def read_file
    clipss_file = Clipss.config.clipss_file
    if clipss_file
      @data = File.read(clipss_file)
    end
  end


end
