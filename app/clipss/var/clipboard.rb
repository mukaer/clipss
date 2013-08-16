module Clipss
  module Var
    class Clipboard
      extend Var
      private_class_method :new

      @os = Clipss::Os.get

      class << self

        def copy(data)
          if @os == :Mac
            Open3.popen3( "#{APP_ROOT}/bin/clipss_pbcopy"){  |input,_,_|  input << data }

          else
            ::Clipboard.copy data
          end
        end

        def paste
          if @os == :Mac
            `#{APP_ROOT}/bin/clipss_pbpaste`
          else
            ::Clipboard.paste
          end

        end

        alias update copy
        alias get    paste
      end

    end
  end
end
