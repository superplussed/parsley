require 'find'

class Parsley
	DOWNLOAD_FOLDER = "/tmp/downloads"
	attr_reader :files_read, :hands_read

	def initialize
		@hand_reader = HandReader.new
		Site.load_hh_identifiers!
	end

	def check_for_uploaded_files
		AWS::S3::Bucket.find($s3_bucket).objects.each {|obj|
			file_name = obj.key
			file_path = "#{DOWNLOAD_FOLDER}/#{file_name}"
			File.open(file_path, 'w') {|f| f.write(obj.value) }
			file_path = Zip.unzip(file_path)
			scan(dir_path)
		}
	end

	def scan path
		@hands_read = 0
		Find.find(path){ |file_name|
			if file_name.include?(".txt")
				@last_line_was_empty = nil
				FileHelper.open(file_name).each_line { |line| process(line) }
				end_hand
			end
		}
	end

private

	def process line
		line.strip!
		if line.empty?
			end_hand unless @last_line_was_empty
		else
  		@hand_reader.read(line)
		end
		@last_line_was_empty = line.empty?
	end

  def end_hand
		@hand_reader.end_hand 
		@hands_read += 1
  end
end
