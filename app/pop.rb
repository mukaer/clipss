class Pop
  include FileBase
  
  def self.run
    runner = new
    runner.read_file
    print runner.get_data
  end

  def self.httpd_run
    runner = new
    runner.read_file
    runner.get_data
  end
  

  



end
