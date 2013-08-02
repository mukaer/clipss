class  Push

  def self.run
    ClipssLog.info("run")
    ClipssLog.debug(Clipss.config)

    @data = ""

    runner = new
    runner.argf_read
    runner.write_file
  end

  def argf_read
    ClipssLog.debug("get_data"){ @data }
    @data  ||= ARGF.read
  end

  def get_data
    ClipssLog.debug("get_data")
    @data
  end

  def set_data(data)
    ClipssLog.debug("set_data"){ @data }
    @data  ||= data
  end

  def write_file
    clipss_file =  Clipss.config.clipss_file

    if clipss_file
      open(clipss_file,"w+") do |f|
        f.print @data

      end
      ClipssLog.debug("write file succsess")
    end

    ClipssLog.debug("write_file end")
  end

  # feature http
  def http_push
    if defined?(url)
      # plugin  post http
      # require 'uri'
      # require 'httpclient'

      # HTTP POST
      content = URI.escape(@data)
      hc      = HTTPClient.new()
      hc.post_content(url,'content' => content)
    end
  end

end
