module Clipss
  class File
    @clipss_file = Clipss.config.clipss_file
    @data
   
    def write_file(data)
      data = convert_data(data)
   
      begin
        open(@clipss_file,"w+") { |f|  f.print data } 
      rescue
        ClipssLog.error("faile don't write file. path=#{@clipss_file}")
      else
        ClipssLog.debug("succsess write file")
      end
      return data
    end
   
   
    def read_file    
      begin
        data = File.read(@clipss_file)
      rescue
        ClipssLog.error("faile don't read file. path=#{@clipss_file}")
      else
        ClipssLog.debug("succsess read file")
      end
   
      return data
    end
   
    def convert_data(data)
      data.gsub("\r\n","\n")
    end
   
  end
end
