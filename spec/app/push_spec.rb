path = File.expand_path "../../" ,__FILE__
require "#{path}/spec_helper"


describe Push do
  it "Clipss.config" do
    expect(Clipss.config.env.length).to         be >(0)
    expect(Clipss.config.log_level.length).to   be >(0)
    expect(Clipss.config.clipss_file.length).to be >(0)
  end

  it "set_data & get_data" do
    obj = Push.new
    data = "this is test"
    obj.set_data(data)
    expect(obj.get_data).to eq(data)
  end


end
