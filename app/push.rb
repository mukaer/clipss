class  Push

  def get_data
    t = Time.now
  end

  def log
    t.strftime '%Y-%m-%d %H:%M:%S'
    
    # LOG FILE
    if defined?(log_path) != nil
      open(log_path,"a+") do |f|
        f.print date
        f.print data
        f.print "\n"
      end
    end
  end

  def write_file
    # BUFFER FILE
    if buffer_path
      open(buffer_path,"w+") do |f|
        f.print data
      end
    end    
  end

  def http_push
    # feature http
    if defined?(url)
      # plugin  post http
      require 'uri'
      require 'httpclient'

      # HTTP POST
      content = URI.escape(data)
      hc      = HTTPClient.new()

      url = url + "?content=#{content}"

      hc.post_content(url,'content' => content)
    end
  end


end
