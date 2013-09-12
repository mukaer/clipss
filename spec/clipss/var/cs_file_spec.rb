require 'spec_helper'

describe Clipss::Var::CsFile do

  it 'should write & read' do
    data = "this is test #{Time.now.to_i}"
    Clipss::Var::CsFile.write data
    expect(Clipss::Var::CsFile.read).to eq(data)
  end

end
