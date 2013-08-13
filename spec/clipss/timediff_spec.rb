require "spec_helper"

describe 'TimeDiff' do

  it 'should now & time_hash' do
    Clipss::TimeDiff.now(:now)
    expect(Clipss::TimeDiff.time_hash.kind_of?(Hash)).to eq(true)
  end

  it "should df" do
    Clipss::TimeDiff.now(:start)
    sleep 0.01
    Clipss::TimeDiff.now(:end)
    expect(Clipss::TimeDiff.df(:start,:end)).to be > (9)
  end

end
