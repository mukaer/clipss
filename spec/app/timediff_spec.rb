path = File.expand_path "../../" ,__FILE__
require "#{path}/spec_helper"

describe 'TimeDiff' do

  it 'should now & time_hash' do
    TimeDiff.now(:now)
    expect(TimeDiff.time_hash.kind_of?(Hash)).to eq(true)
  end

  it "should df" do
    TimeDiff.now(:start)
    sleep 0.01
    TimeDiff.now(:end)
    expect(TimeDiff.df(:start,:end)).to be > (9)
  end

end
