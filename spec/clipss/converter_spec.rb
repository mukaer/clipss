require 'spec_helper'

describe Clipss::Converter do
  after do
    Clipss::Converter.os = Clipss::Os.get
  end

  describe 'windows' do
    before do
      Clipss::Converter.os = :Windows
    end

    it 'should set os ' do
      expect(Clipss::Converter.os).to eq(:Windows)

    end

    it 'should #post_esc  \r\n to \r\n' do
      str1 = sprintf "this \r\n is \r\n windows \r\n"
      str2 = sprintf "this \r\n is \r\n windows \r\n"
      expect(Clipss::Converter.post_esc(str1)).to eq(str2)
    end

    it 'should #post_esc  \n to \r\n' do
      str1 = sprintf "this \n is \r\n windows \n"
      str2 = sprintf "this \r\n is \r\n windows \r\n"
      expect(Clipss::Converter.post_esc(str1)).to eq(str2)
    end

  end

  describe 'Linux' do
    before do
      Clipss::Converter.os = :Linux
    end

    it 'should #post_esc  \r\n  to \n' do
      str1 = sprintf "this \r\n is \r\n windows \r\n"
      str2 = sprintf "this \n is \n windows \n"
      expect(Clipss::Converter.post_esc(str1)).to eq(str2)
    end

  end

  describe 'Mac' do
    before do
      Clipss::Converter.os = :Mac
    end

    it 'should #post_esc  \r\n  to \n' do
      str1 = sprintf "this \r\n is \r\n windows \r\n"
      str2 = sprintf "this \n is \n windows \n"
      expect(Clipss::Converter.post_esc(str1)).to eq(str2)
    end

    it 'should #mac_clipboard_esc  \\ ' do
      str1 =  '\\'
      str2 = sprintf '\\\\'
      expect(Clipss::Converter.mac_clipboard_esc(str1)).to eq(str2)
    end

  end

end
