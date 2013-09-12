module Clipss
  # Converter String
  class Converter
    @os      = Os.get

    class << self
      attr_accessor :os

      def post_esc(str)
        case @os
        when :Windows then windows_esc(str)
        when :Linux   then linux_esc(str)
        when :Mac     then mac_esc(str)
        end
      end

      def windows_esc(str)
        str.gsub!(/\r\n/m, "\n")
        str.gsub!(/\n/m,   "\r\n")
        str
      end

      def linux_esc(str)
        str.gsub!(/\r\n/m, "\n")
        str
      end

      def mac_esc(str)
        str.gsub!(/\r\n/m, "\n")
        str
      end

      def mac_clipboard_esc(str)
        str.gsub!(/\\/m, '\\\\\\\\')
        str
      end
    end
  end
end
