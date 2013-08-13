require "spec_helper"

describe 'Clipss:Clipboard' do

  it 'should get_os' do
    expect(Clipss::Clipboard.get_os.to_s).to match(/Mac|Linux|Windows/)
  end

  it "should copy & paste" do
    data = "this is test #{Time.now.to_i}"
    Clipss::Clipboard.copy data
    expect(Clipss::Clipboard.paste).to eq(data)

  end

end
