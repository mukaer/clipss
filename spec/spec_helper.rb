APP_ROOT = File.expand_path "../../" ,__FILE__
require "#{APP_ROOT}/config/application"


Clipss.configure do
  config.env = :test
  config.log_level = :info
  config.clipss_file = ENV["CLIPSS_FILE"]
end

