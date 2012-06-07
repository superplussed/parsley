module FileHelper

  def self.open file_path
    file_type = `file -Ib #{file_path}`.gsub(/\n/,"")
    File.open(file_path, get_access_string(file_type))
  end

  def self.get_access_string file_type
    case file_type
    when "text/plain; charset=us-ascii"
      "r:ISO8859-1"
    when "Little-endian UTF-16 Unicode English text" 
      "r:UTF-16LE"
    when "text/plain; charset=utf-8"
      "r:UTF-8"
    when "UTF-8 Unicode (with BOM) English text, with CRLF line terminators"
      "rb"
    else
      raise "Unknown file format '#{file_type}' for #{file_path}"
    end
  end

end