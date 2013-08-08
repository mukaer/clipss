class TimeDiff
  def self.now(key)
    @time_hash ||= Hash.new(0)
    tm = Time.now
    @time_hash[key] = milisec(tm)
  end
    
  def self.df(start,finish)
    (@time_hash[finish]- @time_hash[start] ) 
  end

  def self.time_hash
    @time_hash
  end

  def self.milisec(tm)
    ( tm.to_i * 1000 ) + ( tm.usec / 1000.0).round
  end

end
