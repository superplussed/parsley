class String
  def basename 
    self.match('.*\/(.*)')[1]
  end

  def hidden_file? 
    self.match(/.*\/\./)
  end
  
end