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

  def write_file
    clipss_file =  Clipss.config.clipss_file

    if clipss_file
      open(clipss_file,"w+") do |f|
        f.print @data

      end
      ClipssLog.debug("write file succsess")
    end

    ClipssLog.debug("write_file end")
  end

  def read_file
    clipss_file = Clipss.config.clipss_file
    if clipss_file
      @data = File.read(clipss_file)
    end
  end

  
end

