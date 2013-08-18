module Clipss
  module Var
    class History
      extend Var
      private_class_method :new

      @data          = []
      @struct        = Struct.new(:date, :content)
      @max_history   = 100
      @lock          = Monitor.new

      class << self
        def push(str)
          @lock.synchronize do
            data = make_struct_data(str)
            @data.push  data
            @data.shift if @data.length > @max_history
          end
        end

        def pop
          @lock.synchronize { @data.pop}
        end

        def shift
          @lock.synchronize { @data.shift}
        end

        def last
          @data.last
        end

        def length
          @data.length
        end

        def all
          @data
        end

        def get
          d = @data.last
          d.nil? ? nil : d.content
        end

        def max_history(int = nil)
          @max_history = int unless int.nil?
          @max_history
        end

        def max_history= (int)
          @max_history = int
        end

        def make_struct_data(str)
          @struct.new(Time.now,str)
        end

        alias update push

      end
    end
  end
end
