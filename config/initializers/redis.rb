$redis = Redis.new(:host => 'localhost', :port => 6379)

class Redis
	module Connection
		module CommandHelper
			def string_size(string)
		    string.bytesize
			end
		end
	end
end