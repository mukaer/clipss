module Clipss
  module Var
    class Clipboard
      @os = Clipss::Os.get

      def self.copy(data)
        if @os == :Mac
          Open3.popen3( "#{APP_ROOT}/bin/clipss_pbcopy"){  |input,_,_|  input << data }

        else
          ::Clipboard.copy data
        end
      end

      def self.paste
        if @os == :Mac
          `#{APP_ROOT}/bin/clipss_pbpaste`
        else
          ::Clipboard.paste
        end

      end


    end
  end
end
