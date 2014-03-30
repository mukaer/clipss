module Clipss
  module Var

    # Clipboard
    class Clipboard
      extend Var
      private_class_method :new

      @os = Clipss::Os.get

      if @os == :Linux
        if    system('which xclip >/dev/null 2>&1')
          @check = true
        elsif system('which xsel  >/dev/null 2>&1')
          @check = true
        else
          @check = false
        end
      end

      class << self
        attr_accessor :check

        def copy(data)
          if @os == :Mac
            data = Converter.mac_clipboard_esc(data)
            path = "#{APP_ROOT}/bin/clipss_pbcopy"
            Open3.popen3(path) { |input, _, _| input << data }

          else
            ::Clipboard.copy data if @check
          end
        end

        def paste
          if @os == :Mac
            data = `#{APP_ROOT}/bin/clipss_pbpaste`
            data.encode('UTF-8')

          elsif @os == :Windows
            data = ::Clipboard.paste
            data.encode('UTF-8')

          else
            ::Clipboard.paste if @check
          end

        end

        alias_method :update, :copy
        alias_method :get,    :paste
      end

    end
  end
end
