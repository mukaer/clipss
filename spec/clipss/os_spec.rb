require 'spec_helper'

describe Clipss::Os do

  it 'should get' do
    expect(Clipss::Os.get.to_s).to match(/Mac|Linux|Windows/)
  end
end
