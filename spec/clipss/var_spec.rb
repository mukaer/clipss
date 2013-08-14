require 'webmock/rspec'
WebMock.allow_net_connect!

require 'spec_helper'


Clipss::Var::RemoteSvs.remote_svs =  ["http://www.example.com:9116",
                           "http://www.example.com:9117"]
EX_URL_REG = /.*example.*/


describe Clipss::Var do

  it 'should update' do
    data = "This-is-test"

    stub_request(:post,EX_URL_REG).to_return{ |request| { :body => request.body} }
    res = []
    2.times  { res.push  "pushdata=#{data}" }

    Clipss::Var.update data

    expect(Clipss::Var::History.last.content).to eq(data)
    expect(Clipss::Var::CsFile.read_file).to     eq(data)
    expect(Clipss::Var::Clipboard.paste).to      eq(data)
    expect(Clipss::Var::RemoteSvs.push_rsvs(data)).to eq(res)

  end

  it "should get_data" do
    data = Clipss::Var.get_data
    expect(data.length).to  be>(1) 

  end

end
