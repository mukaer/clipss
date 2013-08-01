#!/usr/bin/env ruby


APP_ROOT = File.expand_path "../" ,__FILE__
require "#{APP_ROOT}/config/application.rb"

p "--activesupport-- "
p  TimeDiff.df(:req_gem1,:req_gem2)
p "--httpclient--"
p  TimeDiff.df(:req_gem2,:req_gem3)
p "--aap-----------"
p  TimeDiff.df(:req_app1,:req_app2)
p TimeDiff.time_hash
