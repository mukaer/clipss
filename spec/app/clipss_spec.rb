path = File.expand_path "../../" ,__FILE__
require "#{path}/spec_helper"


describe Clipss do
  
  it "test configure & config" do
    Clipss.configure do
      config.log_level   = 'debug'
      config.clipss_file = '/tmp'      
    end

    expect(Clipss.config.log_level).to eq('debug')
    expect(Clipss.config.clipss_file).to eq('/tmp')    
  end


end
