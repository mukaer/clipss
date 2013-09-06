# Clipss
module Clipss
  # Os
  module Os
    def self.get
      case RbConfig::CONFIG['host_os']
      when /mac|darwin/       then :Mac
      when /linux|bsd|cygwin/ then :Linux
      when /mswin|mingw/      then :Windows
      else
      end

    end

  end
end
