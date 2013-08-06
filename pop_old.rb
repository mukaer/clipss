#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

## test
#   $  ./pop.rb

buffer_path  = ENV["CLIPSS_FILE"]

APP_ROOT = File.expand_path "../" ,__FILE__
log_path = "#{APP_ROOT}/log/pop.log"


t = Time.now
date = t.strftime '%Y-%m-%d %H:%M:%S'

# LOG FILE
if defined?(log_path) != nil
  open(log_path,"a+") do |f|
    f.print "\n"
  end
end



# BUFFER FILE
if buffer_path
  print File.read(buffer_path)
end
