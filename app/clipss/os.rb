module Clipss
  module Os
    def self.get
      os = case RbConfig::CONFIG['host_os']
           when /mac|darwin/       then :Mac
           when /linux|bsd|cygwin/ then :Linux
           when /mswin|mingw/      then :Windows
           else
           end

    end
    
  end
end

