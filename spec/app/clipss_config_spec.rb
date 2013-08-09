path = File.expand_path "../../" ,__FILE__
require "#{path}/spec_helper"

describe ClipssConfig do

  it "log_level" do
    cl = ClipssConfig.new
     expect(cl.log_level).to eq(:warn)
  end

  it "clipss_file" do
    ENV['CLIPSS_PASS'] =  "/tmp/hoge"
    cl = ClipssConfig.new
    expect(cl.clipss_file).to eq("/tmp/hoge")
  end

  it "should sinatra config" do
    cl = ClipssConfig.new
    expect(cl.port).to        eq("9116")
    expect(cl.bind).to        eq("0.0.0.0")
    expect(cl.logging).to     eq(false)
    expect(cl.dump_errors).to eq(false)

  end

end
