path = File.expand_path "../../" ,__FILE__
require "#{path}/spec_helper"

class TestFileBase
  include FileBase
end


describe FileBase do

  it 'should set_data get_data' do
    tfb = TestFileBase.new
    data = Time.now.to_s
    tfb.set_data data
    expect(tfb.get_data).to eq(data)

  end

  it "should convert_data" do
    tfb = TestFileBase.new
    str1 = sprintf "this \r\n is \r\n windows \r\n"
    str2 = sprintf "this \n is \n windows \n"
    expect(tfb.convert_data(str1)).to eq(str2) 
  end

  it "write_file" do
    obj = Push.new
    data = "this is test #{Time.now.to_i}"
    obj.set_data(data)
    obj.write_file
    expect(File.read(Clipss.config.clipss_file)).to eq(data)
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
