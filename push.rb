#!/usr/bin/env ruby


APP_ROOT = File.expand_path "../" ,__FILE__
require "#{APP_ROOT}/config/application.rb"

TimeDiff.now(:main1)
Push.run
TimeDiff.now(:main2)

log = <<EOF
require milsec
--main--
#{TimeDiff.df(:main1,:main2)}

--activesupport--
#{TimeDiff.df(:req_gem1,:req_gem2)}

--httpclient--
#{TimeDiff.df(:req_gem2,:req_gem3)}

--aap-----------
#{TimeDiff.df(:req_app1,:req_app2)}

EOF
ClipssLog.debug(log)

