class ClipssClipboard
  
  def self.copy(data)
    runner = new
    if runner.get_os == :Mac
      Open3.popen3( "#{APP_ROOT}/bin/clipss_pbcopy"){  |input,_,_|  input << data }
      
    else
      Clipboard.copy data
    end
  end

  
  def self.paste
    runner = new    
    if runner.get_os == :Mac
      `#{APP_ROOT}/bin/clipss_pbpaste`
    else
      Clipboard.paste
    end
    
  end

  def get_os
    os = case RbConfig::CONFIG['host_os']
    when /mac|darwin/       then :Mac
    when /linux|bsd|cygwin/ then :Linux
    when /mswin|mingw/      then :Windows
    # when /solaris|sunos/ then :Linux # needs testing..
    else
      raise ClipboardLoadError, "Your OS(#{ RbConfig::CONFIG['host_os'] }) is not supported, using file-based (fake) clipboard"
    end
    
  end
end
