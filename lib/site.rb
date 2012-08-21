class Site

  @@hh_identifiers = {}

  def self.reload_seeds!
    $redis.hmset("identifiers", *["PokerStarsGame", "PST", "FullTilt", "FTP", "Stage#C", "CER"])
  end

  def self.load_hh_identifiers!
    Site.reload_seeds! unless $redis.exists("identifiers")
    $redis.hkeys("identifiers").each { |ident| @@hh_identifiers[ident] = $redis.hget("identifiers", ident) }
  end

  def self.find_from_hh str
    Site.load_hh_identifiers! if @@hh_identifiers.length == 0
    @@hh_identifiers.each{|ident, site_id| return site_id if str.include?(ident)}
    nil
  end
end
