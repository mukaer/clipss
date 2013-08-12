path = File.expand_path "../../" ,__FILE__
require "#{path}/spec_helper"



describe CsFile do
  it "should convert_data" do

    str1 = sprintf "this \r\n is \r\n windows \r\n"
    str2 = sprintf "this \n is \n windows \n"
    expect(CsFile.convert_data(str1)).to eq(str2)
  end

  it "should write_file" do

    data = "this is test #{Time.now.to_i}"

    CsFile.write_file(data)
    expect(File.read(Clipss.config.clipss_file)).to eq(data)
  end

  it "should read_file" do
    data = "this is test #{Time.now.to_i}"
    CsFile.write_file(data)
    expect(CsFile.read_file).to eq(data)
  end
end
