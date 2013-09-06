module Clipss
  module Var
    # History
    class History
      extend Var
      private_class_method :new

      @data          = []
      @struct        = Struct.new(:date, :content)
      @max_history   = 100
      @lock          = Monitor.new

      class << self
        attr_accessor :data, :max_history

        def push(str)
          @lock.synchronize do
            data = make_struct_data(str)
            @data.push  data
            @data.shift if @data.length > @max_history
          end
        end

        def pop
          @lock.synchronize { @data.pop }
        end

        def shift
          @lock.synchronize { @data.shift }
        end

        def last
          @data.last
        end

        def length
          @data.length
        end

        def get
          d = @data.last
          d.nil? ? nil : d.content
        end

        def make_struct_data(str)
          @struct.new(Time.now, str)
        end

        alias_method :update, :push
        alias_method :all,    :data

      end
    end
  end
end
