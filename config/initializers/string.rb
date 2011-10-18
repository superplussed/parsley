require 'iconv'

class String
  def basename 
    self.match('.*\/(.*)')[1]
  end

  def hidden_file? 
    self.match(/.*\/\./)
  end

  def to_ascii_iconv
    self.unpack("U*").map{|c|c.chr}.join
  end
end