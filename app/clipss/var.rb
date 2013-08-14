module Clipss
  module Var
    extend self

    def update(data)

      Var::History.push         data
      Var::CsFile.write_file    data
      Var::Clipboard.copy       data
      Var::RemoteSvs.push_rsvs  data

    end

    def get
      res = Var::History.last
      data = res.content           unless res.nil?
      data = Var::CsFile.read_file if data.nil?
      data = Var::Clipboard.paste  if data.nil?
      data
    end

  end
end
