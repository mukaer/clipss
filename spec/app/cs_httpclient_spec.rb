require 'webmock/rspec'
WebMock.allow_net_connect!

path = File.expand_path "../../" ,__FILE__
require "#{path}/spec_helper"


CsHTTPClient.remote_svs =  ["http://www.example.com:9116",
                           "http://www.example.com:9117"]
EX_URL = "www.example.com"
EX_URL_REG = /.*example.*/

describe 'CsHTTPClient' do

  it "should make_url_push" do
    expect(CsHTTPClient.make_url_push(EX_URL)).to eq("#{EX_URL}/push")     
  end
  
  it 'should post_content' do
    body = "ok"

    stub_request(:post,EX_URL).to_return(:body => body)
    expect( CsHTTPClient.post_content(EX_URL,:pushdata => "hoge") ).to eq(body)     
  end

  it "should post data" do
    data = 'hoge'

    stub_request(:post,EX_URL).to_return{ |request| { :body => request.body} }

    expect( CsHTTPClient.post_content(EX_URL,data) ).to eq(data)     

  end

  it "should push_rsvs" do
    data = 'hoge'
    stub_request(:post,EX_URL_REG).to_return{ |request| { :body => request.body} }

    res = []
    2.times  { res.push  "pushdata=#{data}" }
    
    expect(CsHTTPClient.push_rsvs(data)).to eq(res) 

  end
  
end
