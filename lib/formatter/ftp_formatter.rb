module Formatter
	class FtpFormatter < DefaultFormatter

		def table_max val
			case val
				when "heads up"
					max = 2
				when "6 max, shallow"
					@fields["max_bb"] = 40
					@fields["table_type"] = "shallow"
					max = 6
				when "6 max"
					max = 6
				else 
					max = 9
			end
			@fields["table_max"] = max
		end

		def game_type val
			ary = val.rpartition("Limit ")
			limit_type = ary[0]
			game_type = ary[2]
			case limit_type.strip!
			when "Pot"
				limit_type = "PL"
			when "No"
				limit_type = "NL"
			else
				limit_type = "FL"
			end
			@fields["limit_type"] = limit_type;
			@fields["game_type"] = game_type.eql?("Hold'em") ? "HE" : "Omaha"
		end
	end
end