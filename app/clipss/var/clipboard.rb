module Clipss
  module Var

    # Clipboard
    class Clipboard
      extend Var
      private_class_method :new

      @os = Clipss::Os.get

      class << self

        def copy(data)
          if @os == :Mac
            path = "#{APP_ROOT}/bin/clipss_pbcopy"
            Open3.popen3(path) { |input, _, _| input << data }

          else
            ::Clipboard.copy data
          end
        end

        def paste
          if @os == :Mac
            `#{APP_ROOT}/bin/clipss_pbpaste`

          elsif @os == :Windows
            data = ::Clipboard.paste
            data.encode('UTF-8')

          else
            ::Clipboard.paste
          end

        end

        alias_method :update, :copy
        alias_method :get,    :paste
      end

    end
  end
end
