require "spec_helper"

describe Clipss::Var::Clipboard do

  it "should copy & paste" do
    data = "this is test #{Time.now.to_i}"
    Clipss::Var::Clipboard.copy data
    expect(Clipss::Var::Clipboard.paste).to eq(data)

  end

end
