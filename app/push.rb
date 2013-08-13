class  Push
  include FileBase

  def self.run
    ClipssLog.info("run")
    ClipssLog.debug(Clipss.config)

    @data = ""

    runner = new
    runner.argf_read
    runner.write_file
    ClipssClipboard.copy data

  end

  def self.httpd_run(data)

    runner = new
    runner.set_data  data

    Thread.start do
      runner.write_file
      ClipssClipboard.copy data
    end

  end

  def argf_read
    ClipssLog.debug("get_data"){ @data }
    @data  ||= ARGF.read
  end


  # feature http
  def self.http_push_run(url)
    runner = new
    runner.read_file

  end

  def http_push

      # HTTP POST
      content = URI.escape(@data)
      hc      = HTTPClient.new()
      hc.post_content(url,'content' => content)


  end

end
