path = File.expand_path "../../" ,__FILE__
require "#{path}/spec_helper"


describe Pop do
  it "Clipss.config" do
    expect(Clipss.config.env.length).to         be >(0)
    expect(Clipss.config.log_level.length).to   be >(0)
    expect(Clipss.config.clipss_file.length).to be >(0)
  end

  it "set_data & get_data" do
    obj = Pop.new
    data = "this is test"
    obj.set_data(data)
    expect(obj.get_data).to eq(data)
  end

  it "should read_file" do
    obj_pop  = Pop.new
    obj_push = Push.new

    data = "this is test #{Time.now.to_i}"
    obj_push.set_data(data)
    obj_push.write_file

    obj_pop.read_file
    expect(obj_pop.get_data).to eq(data)

  end

end
