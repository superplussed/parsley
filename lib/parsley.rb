require File.join(File.dirname(__FILE__), '..', 'config/boot')

class Parsley
	
	@@file_path = nil
	
	def self.file_path
		@@file_path
	end

	def initialize file_path
		@@file_path, @last_line_had_text = file_path, nil
		@hand_reader = HandReader.new
		Site.load_hh_identifiers!
		read_from_file
	end
 
  def read_from_file 
		#RubyProf.start
		filetype = Mahoro.new.file(@@file_path)
    File.open(@@file_path, get_access_string(filetype)) do |f|
			f.each_line do |line|
				line.rstrip!
				this_line_has_text = !line.empty?
      	@hand_reader.read(line) if this_line_has_text
				@hand_reader.end_hand if (!this_line_has_text && @last_line_had_text) || f.eof
				@last_line_had_text = this_line_has_text
			end
    end 
		#RubyProf.end(hide_rails: true)
  end

	private
		
	def get_access_string filetype
		case filetype
		when "Little-endian UTF-16 Unicode English text" 
    	"r:UTF-16LE"
    when "UTF-8 Unicode (with BOM) English text"
      "r:UTF-8"
    else
    	"r:UTF-8"
		end
	end
end