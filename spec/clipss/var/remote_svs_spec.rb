require 'webmock/rspec'
WebMock.allow_net_connect!

require 'spec_helper'

describe Clipss::Var::RemoteSvs do

  it 'should make_url_push' do
    r = Clipss::Var::RemoteSvs.make_url_push(EX_URL)
    expect(r).to eq("#{EX_URL}/push")
  end

  it 'should post_content' do
    body = 'ok'

    stub_request(:post, EX_URL).to_return(body:  body)
    content = Clipss::Var::RemoteSvs.post_content(EX_URL, pushdata: 'hoge')
    expect(content).to eq(body)
  end

  it 'should post data' do
    data = 'hoge'

    stub_request(:post, EX_URL).to_return { |request| { body: request.body } }

    expect(Clipss::Var::RemoteSvs.post_content(EX_URL, data)).to eq(data)

  end

  it 'should push_rsvs' do
    data = 'hoge'
    stub_request(:post, EX_URL_REG).to_return do |request|
      { body: request.body }
    end

    res = []
    2.times  { res.push  "pushdata=#{data}" }

    expect(Clipss::Var::RemoteSvs.push_rsvs(data)).to eq(res)

  end

end
