require File.join(File.dirname(__FILE__), 'formatter/default_formatter')
Dir.glob(File.join(File.dirname(__FILE__), 'formatter/', "*.rb")) { |file| require file}

module Formatter  
	def self.get fields
		case fields["site_id"]
   		when "FTP"; formatter = FtpFormatter.new(fields)
			when "PST"; formatter = PstFormatter.new(fields)
			when "CER"; formatter = CerFormatter.new(fields)
		end
		formatter.fields
	end
end