#Push Remote Server
class PushRSV
  include FileBase

  def self.run (data = nil)
    runner = new
    data = data || runner.read_file
    @hc ||= HTTPClient.new()

    Clipss.config.remote_svs.each do |url|
      ClipssLog.debug("post date #{data}")
      begin
        result = @hc.post_content("#{url}/push",'pushdata' => data)
      rescue
        ClipssLog.info("cannot post_content #{url}")
      else
        ClipssLog.info("push_rsv #{url}")
        ClipssLog.debug("post result#{result}")
      end

    end

  end

end
