require "spec_helper"

describe Clipss::Config do

  it "log_level" do
    cl = Clipss::Config.new
    expect(cl.log_level).to eq(:warn)
  end

  it "clipss_file" do
    ENV['CLIPSS_FILE'] =  "/tmp/hoge"
    cl = Clipss::Config.new
    expect(cl.clipss_file).to eq("/tmp/hoge")
  end

  it "should sinatra config" do
    cl = Clipss::Config.new
    expect(cl.port).to        eq("9116")
    expect(cl.bind).to        eq("0.0.0.0")
    expect(cl.logging).to     eq(false)
    expect(cl.dump_errors).to eq(false)

  end

end
