require 'spec_helper'


describe Clipss::Cmd do

  it 'should push_cli pop_cli' do
    data = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    stub_request(:post,EX_URL_REG).to_return{ |request| { :body => request.body} }

    Clipss::Cmd.push_cli data

    path = "#{APP_ROOT}/tmp/spec.log"

    $stdout = File.open(path,"w")
    res = Clipss::Cmd.pop_cli
    $stdout = STDOUT
    expect(res).to eq(data)

  end

  it "should push_http" do
    data = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    Clipss::Cmd.push_http data

    expect(Clipss::Var::History.last.content).to eq(data)
    expect(Clipss::Var::CsFile.read).to     eq(data)
    expect(Clipss::Var::Clipboard.paste).to      eq(data)
  end

  it "should push_http_rsv" do
    data = "abcdefghijklmnopqrstuvwxyz"
    stub_request(:post,EX_URL_REG).to_return{ |request| { :body => request.body} }

    Clipss::Var::CsFile.write data

    Clipss::Cmd::push_http_rsv
    expect(Clipss::Var::History.last.content).to eq(data)

  end

end
