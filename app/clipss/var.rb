# Clipss
module Clipss
  # Var is abstract
  module Var

    def update(data)
      raise 'abstract method update'
    end

    def get
      raise 'abstract method get'
    end

  end
end
