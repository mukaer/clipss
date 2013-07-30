#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

## test
#   $ echo hoge | ./push.rb

buffer_path  = ENV["CLIPSS_FILE"]

APP_ROOT = File.expand_path "../" ,__FILE__
log_path = "#{APP_ROOT}/log/push.log"


# feature
#url          = "http://192.168.0.2:8080/push/"


t = Time.now
date = t.strftime '%Y-%m-%d %H:%M:%S'
data    = ARGF.read

# LOG FILE
if defined?(log_path) != nil
  open(log_path,"a+") do |f|
    f.print date
    f.print data
    f.print "\n"
  end
end


# BUFFER FILE
if buffer_path
  open(buffer_path,"w+") do |f|
      f.print data
  end
end


# feature
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

