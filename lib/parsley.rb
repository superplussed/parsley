require File.join(File.dirname(__FILE__), '..', 'config/boot')

class Parsley

	@@file_path = nil
	
	def self.file_path
		@@file_path
	end
	
	attr_reader :file_count, :files_read, :hands_read

	def initialize file_path
		@@file_path, @last_line_had_text, @files_read, @hands_read = file_path, nil, 0, 0
		@hand_reader = HandReader.new
		Site.load_hh_identifiers!
		p file_path
		@@file_path = Zip.unzip(file_path) if file_path.match(/\.zip$/)
		if File.directory?(@@file_path)
			read_directory
		elsif File.exist?(@@file_path)
			@file_count = 1
			read_file
		else
			@file_count = 0
			send_not_found
		end
	end
	
	private
	
	def read_directory
		require 'find'
		
		dir, files = @@file_path, []
		Find.find(dir){ |fn| files.push(fn) unless Dir.exist?(fn) || hidden_file?(fn)}
		@file_count = files.count
		files.each {|fn|
			@files_read += 1
			@@file_path = fn
			read_file 
		}
	end
	
	def send_not_found
		
	end
 
  def read_file 
		#RubyProf.start
		filetype = Mahoro.new.file(@@file_path)
    File.open(@@file_path, get_access_string(filetype)) do |f|
			f.each_line do |line|
				line.rstrip!
				this_line_has_text = !line.empty?
      	@hand_reader.read(line) if this_line_has_text
				if (!this_line_has_text && @last_line_had_text) || f.eof
						@hand_reader.end_hand 
						@hands_read += 1
				end
				@last_line_had_text = this_line_has_text
			end
    end 
		#RubyProf.end(hide_rails: true)
  end

	def hidden_file? string
		string.match(/.*\/\./)
	end
		
	def get_access_string filetype
		case filetype
		when "Little-endian UTF-16 Unicode English text" 
    	"r:UTF-16LE"
    when "UTF-8 Unicode (with BOM) English text"
      "r:UTF-8"
    when "UTF-8 Unicode (with BOM) English text, with CRLF line terminators"
			"rb"
		else
    	raise "Unknown file format '#{filetype}' for #{@@file_path}"
		end
	end
end