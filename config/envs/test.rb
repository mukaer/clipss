Clipss.configure do
  config.env         = :test
  config.log_level   = :info

  config.clipss_file = "#{APP_ROOT}/tmp/clipss_file"
  config.remote_svs =  ['http://www.example.com:9116",
                           "http://www.example.com:9117']

  config.logging     = false
  config.dump_errors = true
end
