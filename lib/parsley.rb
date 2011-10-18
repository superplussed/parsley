require File.join(File.dirname(__FILE__), '..', 'config/boot')

class Parsley
	DOWNLOAD_FOLDER = "/tmp/downloads"
	attr_reader :file_count, :files_read, :hands_read

	def initialize
		@hand_reader = HandReader.new
		@coder = HTMLEntities.new
		Site.load_hh_identifiers!
	end

	def check_for_files
		@last_line_had_text, @files_read, @hands_read = nil, 0, 0
		AWS::S3::Bucket.find('robusto.uploads').objects.each {|obj|
			@files_read += 1
			@file_name = obj.key
			@file_path = "#{DOWNLOAD_FOLDER}/#{@file_name}"
			File.open(@file_path, 'w') {|f| f.write(obj.value) }
			@file_path = Zip.unzip(@file_path)
			process_files (@file_path)
		}
	end

	private

	def process_files file_path
		if File.directory?(@file_path)
			read_directory
		elsif File.exist?(@file_path)
			@file_count = 1
			read_file
		else
			@file_count = 0
		end
	end

	def read_directory
		require 'find'

		dir, files = @file_path, []
		Find.find(dir){ |fn| files.push(fn) unless Dir.exist?(fn) || fn.hidden_file?}
		@file_count = files.count
		files.each {|fn|
			@files_read += 1
			@file_path = fn
			read_file 
		}
	end
 
  def read_file 
		filetype = `file -Ib #{@file_path}`.gsub(/\n/,"")
    File.open(@file_path, get_access_string(filetype)) do |f|
			f.each_line do |line|
				line.strip!
				this_line_has_text = !line.empty?
      	@hand_reader.read(line) if this_line_has_text
				if (!this_line_has_text && @last_line_had_text) || f.eof
						@hand_reader.end_hand 
						@hands_read += 1
				end
				@last_line_had_text = this_line_has_text
			end
    end
  end

	def get_access_string filetype
		case filetype
		when "text/plain; charset=us-ascii"
			"r:ISO8859-1"
		when "Little-endian UTF-16 Unicode English text" 
    	"r:UTF-16LE"
    when "text/plain; charset=utf-8"
      "r:UTF-8"
    when "UTF-8 Unicode (with BOM) English text, with CRLF line terminators"
			"rb"
		else
    	raise "Unknown file format '#{filetype}' for #{@file_path}"
		end
	end
end