module Clipss
  module Var
    class All
      extend Var
      private_class_method :new

      class << self
        def update(data)

          Var::History.update       data
          Var::CsFile.update        data
          Var::Clipboard.update     data
          Var::RemoteSvs.update     data

        end

        def get
          data = Var::History.get
          data = Var::CsFile.get       if data.nil?
          data = Var::Clipboard.get    if data.nil?
          data = Var::RemoteSvs.get    if data.nil?
          data
        end
      end
    end
  end
end
