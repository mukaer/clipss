# Clipss
module Clipss
  # Cmd
  module Cmd

    def push_cli(data)
      Var::All.update    data
    end

    def pop_cli
      data = Var::All.get
      print data
      data
    end

    def push_http(data)
      data = Converter.post_esc data
      Var::History.update       data
      Var::CsFile.update        data
      Var::Clipboard.update     data
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
      Var::All.get
    end

    module_function(:push_cli ,
                    :pop_cli ,
                    :push_http ,
                    :push_http_rsv ,
                    :push_cwatcher  ,
                    :pop_http
                    )

  end
end
