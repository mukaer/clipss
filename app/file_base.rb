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

    @data = convert_data(@data)

    if clipss_file
      begin
        open(clipss_file,"w+") do |f|
          f.print @data
        end
      rescue
        ClipssLog.error("faile don't write file ")
      else
        ClipssLog.debug("succsess write file")
      end

    end

  end

  def read_file
    clipss_file = Clipss.config.clipss_file
    if clipss_file
      begin
        @data = File.read(clipss_file)
      rescue
        ClipssLog.error("faile don't read file ")
      else
        ClipssLog.debug("succsess read file")
      end

    end
  end

  def convert_data(data)
    data.gsub("\r\n","\n")
  end

end
