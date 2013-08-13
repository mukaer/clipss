require 'spec_helper'

describe 'Clipss::Log' do

  it 'should debug' do
    data = "this is debug #{Time.now.to_i}"
    Clipss.config.log_level = :debug
    Clipss::Log.debug(data)
    expect(File.readlines("#{APP_ROOT}/log/test.log").last).to match(data)
  end

  it 'should info' do
    data = "this is info #{Time.now.to_i}"
    Clipss.config.log_level = :info
    Clipss::Log.info(data)
    expect(File.readlines("#{APP_ROOT}/log/test.log").last).to match(data)
  end

  it 'should warn' do
    data = "this is warn #{Time.now.to_i}"
    Clipss.config.log_level = :warn
    Clipss::Log.warn(data)
    expect(File.readlines("#{APP_ROOT}/log/test.log").last).to match(data)
  end

  it 'should error' do
    data = "this is warn #{Time.now.to_i}"
    Clipss.config.log_level = :error
    Clipss::Log.error(data)
    expect(File.readlines("#{APP_ROOT}/log/test.log").last).to match(data)
  end

  it 'should fatal' do
    data = "this is warn #{Time.now.to_i}"
    Clipss.config.log_level = :fatal
    Clipss::Log.fatal(data)
    expect(File.readlines("#{APP_ROOT}/log/test.log").last).to match(data)
  end
  
end
