class Pop


  def log


    log_path = "#{APP_ROOT}/log/pop.log"


    t = Time.now
    date = t.strftime '%Y-%m-%d %H:%M:%S'

    # LOG FILE
    if defined?(log_path) != nil
      open(log_path,"a+") do |f|
        f.print "\n"
      end
    end
  end




  def file
    # BUFFER FILE
    if buffer_path
      print File.read(buffer_path)
    end
  end


end
