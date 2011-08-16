require File.join(File.dirname(__FILE__), '..', 'config/boot')

class Parsley
	TEST_HH_PATH = "../files/hh/"
	@@current_file_name = nil
	
	def self.current_file_name
		@@current_file_name
	end

	def initialize file_name
		@file_name, @last_line_had_text, @@current_file_name = file_name, nil, file_name
		@hand_reader = HandReader.new
		Site.load_hh_identifiers!
		read_from_file
	end
 
  def read_from_file 
		#RubyProf.start
		filetype = Mahoro.new.file(full_path)
    File.open(full_path, get_access_string(filetype)) do |f|
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
		
	def get_access_string(filetype)
		case filetype
		when "Little-endian UTF-16 Unicode English text" 
    	"r:UTF-16LE"
    when "UTF-8 Unicode (with BOM) English text"
      "r:UTF-8"
    else
    	"r:UTF-8"
		end
	end
  
	def full_path 
		File.join(File.dirname(__FILE__), TEST_HH_PATH, "#{@file_name}.txt")
	end
end