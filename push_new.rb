#!/usr/bin/env ruby

APP_ROOT = File.expand_path "../" ,__FILE__
require "#{APP_ROOT}/config/application.rb"

Push.run


log = <<EOF
require milsec
--activesupport--
#{TimeDiff.df(:req_gem1,:req_gem2)}

--httpclient--
#{TimeDiff.df(:req_gem2,:req_gem3)}

--aap-----------
#{TimeDiff.df(:req_app1,:req_app2)}

EOF
ClipssLog.debug(log)
