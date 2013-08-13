module Clipss
  module Var
    class Clipboard
      def self.copy(data)
        if get_os == :Mac
          Open3.popen3( "#{APP_ROOT}/bin/clipss_pbcopy"){  |input,_,_|  input << data }

        else
          ::Clipboard.copy data
        end
      end

      def self.paste
        if get_os == :Mac
          `#{APP_ROOT}/bin/clipss_pbpaste`
        else
          ::Clipboard.paste
        end

      end

      def self.get_os
        os = case RbConfig::CONFIG['host_os']
             when /mac|darwin/       then :Mac
             when /linux|bsd|cygwin/ then :Linux
             when /mswin|mingw/      then :Windows
             else
             end

      end
    end
  end
end
