module Clipss
  module Var
    class CsFile
      extend Var
      private_class_method :new
      @clipss_file = Clipss.config.clipss_file
      @data

      class << self

        def write(data)
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


        def read
          begin
            data = File.read(@clipss_file)
          rescue
            Log.error("faile don't read file. path=#{@clipss_file}")
          else
            Log.debug("succsess read file")
          end

          return data
        end

        def convert_data(data)
          data.gsub("\r\n","\n")
        end

        alias update write
        alias get    read
      end
    end
  end
end
