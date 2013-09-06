require 'spec_helper'

describe Clipss::Var::All do

  it 'should update' do
    data = 'This-is-test'

    stub_request(:post, EX_URL_REG).to_return do |request|
      { body: request.body }
    end
    res = []
    2.times  { res.push  "pushdata=#{data}" }

    Clipss::Var::All.update data

    expect(Clipss::Var::History.last.content).to      eq(data)
    expect(Clipss::Var::CsFile.read).to               eq(data)
    expect(Clipss::Var::Clipboard.paste).to           eq(data)
    expect(Clipss::Var::RemoteSvs.push_rsvs(data)).to eq(res)

  end

  it 'should get' do
    data = Clipss::Var::All.get
    expect(data.length).to  be > (1)

  end

end
