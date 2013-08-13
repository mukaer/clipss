require "spec_helper"

describe Clipss::Var::CsFile do

  it "should convert_data" do
    str1 = sprintf "this \r\n is \r\n windows \r\n"
    str2 = sprintf "this \n is \n windows \n"
    expect(Clipss::Var::CsFile.convert_data(str1)).to eq(str2) 
  end

  it "should write_file & read_file" do
    data = "this is test #{Time.now.to_i}"
    Clipss::Var::CsFile.write_file data
    expect(Clipss::Var::CsFile.read_file).to eq(data)
  end
  

end
