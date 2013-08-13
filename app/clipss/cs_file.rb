module Clipss
  class CsFile
    @clipss_file = Clipss.config.clipss_file
    @data

    def self.write_file(data)
      data = convert_data(data)

      begin
        open(@clipss_file,"w+") { |f|  f.print data }
      rescue
        Log.error("faile don't write file. path=#{@clipss_file}")
      else
        Log.debug("succsess write file")
      end
      return data
    end


    def self.read_file
      begin
        data = File.read(@clipss_file)
      rescue
        Log.error("faile don't read file. path=#{@clipss_file}")
      else
        Log.debug("succsess read file")
      end

      return data
    end

    def self.convert_data(data)
      data.gsub("\r\n","\n")
    end

  end
end
