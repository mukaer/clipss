module Clipss
  module Cmd
    extend self

    def push_cli(data)
      Var.update    data
    end

    def pop_cli
      data = Var.get
      print data
      data
    end

    def push_http(data)
      Var::History.push    data
      Var::CsFile.write    data
      Var::Clipboard.copy  data
    end

    def push_http_rsv
      data = Var::CsFile.read
      Var::History.push         data
      Var::RemoteSvs.push_rsvs  data
    end

    def pop_http
      Var.get
    end

  end
end
