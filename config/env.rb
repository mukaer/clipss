if APP == :spec
  require "#{APP_ROOT}/config/envs/test"
else
  require "#{APP_ROOT}/config/envs/#{Clipss.config.env.to_s}"
end
