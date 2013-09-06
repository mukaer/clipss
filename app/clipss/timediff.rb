# Clipss
module Clipss
  # TimeDiff
  module TimeDiff
    attr_accessor :time_hash

    def now(key)
      @time_hash ||= Hash.new(0)
      tm = Time.now
      @time_hash[key] = milisec(tm)
    end

    def df(start, finish)
      @time_hash[finish] - @time_hash[start]
    end

    def milisec(tm)
      (tm.to_i * 1000) + ( tm.usec / 1000.0).round
    end

    module_function :now, :df, :time_hash, :milisec
  end
end
