module Zip
	require 'zip/zip'
	
	def self.unzip file_path
		dest_path = Zip.create_dir(file_path)
		Zip::ZipFile.open(file_path) { |zip_file|
		   zip_file.each { |f|
		     f_path=File.join(dest_path, f.name)
		     FileUtils.mkdir_p(File.dirname(f_path))
		     zip_file.extract(f, f_path) unless File.exist?(f_path)
		   }
		}
		dest_path
	end
	
	def self.create_dir file_path
		new_path = File.join(File.dirname(file_path), File.basename(file_path, '.zip').concat(Time.new.to_s.gsub!(" ", "").gsub!(":", "-")))
		Dir.mkdir(new_path)
		new_path
	end
	
end