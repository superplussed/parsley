module Formatter
	class FtpFormatter < DefaultFormatter

		def table_max val
			case val
	 			when "heads up"
					val = 2
	 			when "6 max, shallow"
					@fields["max_bb"] = 40
					@fields["table_type"] = "shallow"
					val = 6
				when "6 max"
					val = 6
	 			else 
					val = 9
			end
			@fields["table_max"] = val
		end

		def game_type val
			ary = val.rpartition("Limit ")
			limit_type = ary[0]
			game_type = ary[2]
			case limit_type.strip!
			when "Pot"
				@fields["limit_type"] = "PL"
			when "No"
				@fields["limit_type"] = "NL"
			else
				@fields["limit_type"] = "FL"
			end
			game_type.eql?("Hold'em") ? @fields["game_type"] = "HE" : @fields["game_type"] = "Omaha"
		end
	end
end