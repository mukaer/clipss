require 'spec_helper'

describe Clipss::ClipboardWatcher do

  it 'should loop_process' do
    data = "this id test #{Time.now.to_s}"
    Clipss::Var::Clipboard.copy data
    stub_request(:post, EX_URL_REG).to_return do |request|
      { body: request.body }
    end

    Clipss::ClipboardWatcher.loop_process

    expect(Clipss::Var::History.get).to eq(data)
    expect(Clipss::Var::CsFile.get).to eq(data)

  end

end if Clipss::Var::Clipboard.check
