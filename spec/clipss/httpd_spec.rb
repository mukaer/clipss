require 'spec_helper'

describe 'description' do
  include Rack::Test::Methods

  def app
    Clipss::Httpd
  end

  it 'should get / response.ok?' do
    get '/'
    expect(last_response.ok?).to be_true
  end

  it "should get '/' a contents" do
    get '/'
    body = last_response.body
    parser = Nokogiri::HTML(body)

    res = []
    parser.css('p > a').each  { |a| res.push a.inner_html}

    eq_res = ["SHOW", "HISTORY", "SET", "PUSH_RSV RUN"]
    expect(res).to eq(eq_res)

  end

  it "should post '/push' " do
    data= Time.now.to_s
    post '/push' ,{ :pushdata => data}
    expect(Clipss::Var.get).to eq(data)

  end

  it "should get '/history' " do
    get '/history'
    body = last_response.body
    parser = Nokogiri::HTML(body)

    div = parser.css('div')
    expect(div.length).to be>(0)

  end

end
