#Push Remote Server
class PushRSV
  include FileBase

  def self.run (data = nil)
    runner = new
    data = data || runner.read_file
    @hc ||= HTTPClient.new()

    Clipss.config.remote_svs.each do |url|
      ClipssLog.debug("post date \n--data start--\n#{data}\n--data end--\n")
      begin
        result = @hc.post_content("#{url}/push",'pushdata' => data)
      rescue
        ClipssLog.info("cannot post_content #{url}")
      else
        ClipssLog.info("push_rsv #{url}")
        ClipssLog.debug("post  \n--data start--\n#{result}\n--data end--\n")
      end

    end

  end

end
