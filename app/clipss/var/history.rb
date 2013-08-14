module Clipss
  module Var
    class History

      private_class_method :new

      @data          = []
      @max_history  = 100
      @lock         = Monitor.new

      class << self
        def push(str)
          @lock.synchronize do
            data = make_hash(str)
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

        def max_history(int = nil)
          @max_history = int unless int.nil?
          @max_history
        end

        def max_history= (int)
          @max_history = int
        end

        def make_hash(str)
          hash = { :time => Time.now, :content => str}
          adds_method_abstract_data_type(hash)
        end

        def adds_method_abstract_data_type(hash)
          hash.each_key do |key|
            eval "def hash.#{key} ;   self[:#{key}] end"
          end

          hash
        end


      end


    end
  end
end
