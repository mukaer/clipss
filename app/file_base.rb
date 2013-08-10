module FileBase
  @data

  def get_data
    ClipssLog.debug("get_data")
    @data
  end

  def set_data(data)
    ClipssLog.debug("set_data"){ @data }
    @data  ||= data
  end

  def write_file(data = nil)
    clipss_file =  Clipss.config.clipss_file
    @data = data || @data

    @data = convert_data(@data)

    begin
      open(clipss_file,"w+") { |f|  f.print @data } 
    rescue
      ClipssLog.error("faile don't write file path:#{clipss_file}")
    else
      ClipssLog.debug("succsess write file")
    end

    return @data
  end

  def read_file
    clipss_file = Clipss.config.clipss_file
    
    begin
      @data = File.read(clipss_file)
    rescue
      ClipssLog.error("faile don't read file path:#{clipss_file}")
    else
      ClipssLog.debug("succsess read file")
    end

    return @data
  end

  def convert_data(data)
    data.gsub("\r\n","\n")
  end

end
