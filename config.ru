# rackup

APP=:httpd
APP_ROOT = File.expand_path '../', __FILE__
require "#{APP_ROOT}/config/application"

run ClipssHttpd
