module Clipss
  module Cmd
    extend self

    def push_cli(data)
      Var::All.update    data
    end

    def pop_cli
      data = Var::All.get
      print data
      data
    end

    def push_http(data)
      Var::History.update    data
      Var::CsFile.update     data
      Var::Clipboard.update  data
    end

    def push_http_rsv
      data = Var::CsFile.read
      Var::History.push         data
      Var::RemoteSvs.push_rsvs  data
    end

    def push_cwatcher(data)
      Var::History.update   data
      Var::CsFile.update    data
      Var::RemoteSvs.update data
    end

    def pop_http
      Var.get
    end

  end
end
