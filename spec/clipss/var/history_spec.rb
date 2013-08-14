require "spec_helper"

describe Clipss::Var::History do


  it "should push max_history  " do
    Clipss::Var::History.max_history = 10
    expect(Clipss::Var::History.max_history).to eq(10)
  end

  it "should push max history & length" do
    max = Clipss::Var::History.max_history
    max_plus_one = max + 1

    max_plus_one.times do
      str = "this is test #{Time.now} "
      Clipss::Var::History.push(str)
    end
    expect(Clipss::Var::History.length).to eq(max)
  end


  it 'should psuh & last' do
    time = Time.now
    str = "this is test #{time}"
    Clipss::Var::History.push(str)

    expect(Clipss::Var::History.last.content).to eq(str)
    expect(Clipss::Var::History.last.time).to   be>(time)
  end

  it "should pop" do
    i = Clipss::Var::History.length
    Clipss::Var::History.pop
    expect(Clipss::Var::History.length).to eq(i-1)
  end

  it "should shift" do
    i = Clipss::Var::History.length
    Clipss::Var::History.shift
    expect(Clipss::Var::History.length).to eq(i-1)
  end

end
