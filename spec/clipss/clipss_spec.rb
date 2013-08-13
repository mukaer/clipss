require "spec_helper"

describe Clipss do

  it "configure & config  env production " do
    Clipss.configure do
      config.env = :production
      config.log_level = :warn
      config.clipss_file = ENV['CLIPSS_FILE']
    end

    expect(Clipss.config.env).to eq(:production)
    expect(Clipss.config.log_level).to eq(:warn)
    expect(Clipss.config.clipss_file).to eq(ENV['CLIPSS_FILE'])
  end

  it "configure & config  env test" do
    Clipss.configure do
      config.env = :test
      config.log_level = :info
      config.clipss_file = ENV['CLIPSS_FILE']
    end

    expect(Clipss.config.env).to eq(:test)
    expect(Clipss.config.log_level).to eq(:info)
    expect(Clipss.config.clipss_file).to eq(ENV['CLIPSS_FILE'])
  end

  it "should conigure set custom val" do
    v = :thistest
    Clipss.configure do
      config.env         = v
      config.log_level   = v
      config.clipss_file = v
      config.port        = v
      config.bind        = v
      config.logging     = v
      config.dump_errors = v
      config.remote_svs  = v
    end

    expect(Clipss.config.env               ).to eq(v)
    expect(Clipss.config.log_level         ).to eq(v)
    expect(Clipss.config.clipss_file       ).to eq(v)
    expect(Clipss.config.port              ).to eq(v)
    expect(Clipss.config.bind              ).to eq(v)
    expect(Clipss.config.logging           ).to eq(v)
    expect(Clipss.config.dump_errors       ).to eq(v)
    expect(Clipss.config.remote_svs        ).to eq(v)

  end

  it "should configre" do

    Clipss.configure do
      config.env         = :development
      config.clipss_file = 'C:\tmp\clispss_file.txt'
      config.bind        = 'localhost'
      config.port        =  "9115"
      config.remote_svs  = ["http://192.168.0.31:9116"]
    end

    expect(Clipss.config.env               ).to eq(:development)
    expect(Clipss.config.clipss_file       ).to eq('C:\tmp\clispss_file.txt')
    expect(Clipss.config.port              ).to eq('9115')
    expect(Clipss.config.bind              ).to eq('localhost')
    expect(Clipss.config.remote_svs        ).to eq(["http://192.168.0.31:9116"])

  end

end
