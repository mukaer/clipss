path = File.expand_path "../../" ,__FILE__
require "#{path}/spec_helper"

describe ClipssClipboard do
  
  it 'should copy paste' do
    str = Time.new.to_s
    ClipssClipboard.copy(str)
    expect(ClipssClipboard.paste).to eq(str) 
    
  end
  
end




