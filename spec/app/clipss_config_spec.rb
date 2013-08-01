path = File.expand_path "../../" ,__FILE__
require "#{path}/spec_helper"

describe ClipssConfig do

  it "log_level" do
    cl = ClipssConfig.new
     expect(cl.log_level).to eq('warn')
  end

  it "clipss_file" do
    ENV['CLIPSS_PASS'] =  "/tmp/hoge"
    cl = ClipssConfig.new
    expect(cl.clipss_file).to eq("/tmp/hoge")
  end

end
