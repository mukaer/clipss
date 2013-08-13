module CsHTTPClient
  extend self
  attr_accessor :remote_svs
  
  @hc         = HTTPClient.new()
  @remote_svs = Clipss.config.remote_svs
  
  def push_rsvs(data)
    ClipssLog.debug("post date \n--data start--\n#{data}\n--data end--\n")
    
    @result = []

    #future thread Parallel
    @remote_svs.each do |url|
      Timeout.timeout(1) do
        @result.push  post_content(make_url_push(url),'pushdata' => data)
      end
    end

    @result
  end

  def post_content(url,hash_data)

    begin
      result = @hc.post_content(url,hash_data)
    rescue
      ClipssLog.info("cannot post_content #{url}")
    else
      ClipssLog.info("push_rsv #{url}")
      ClipssLog.debug("post  \n--data start--\n#{result}\n--data end--\n")
    end
    result
  end


  def make_url_push (url)
    "#{url}/push"    
  end
end
