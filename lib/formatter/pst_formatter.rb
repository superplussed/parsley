module Formatter
	class PstFormatter < DefaultFormatter

		def table_max val
			case val 
			when "2-max"
				table_max = 2
			when "6-max"
				table_max = 6
			else
				table_max = 9
			end
			@fields["table_max"] = table_max
		end

		def game_type val
			val.sub!("'", '') unless val.nil?
			game_type = val.slice!(/\w+/)
			case val.strip!
			when "Pot Limit"
				limit_type = "PL"
			when "Limit"
				limit_type = "FL"
			else
				limit_type = "NL"
			end
			@fields["limit_type"] = limit_type
			game_type.eql?("Omaha") ? @fields["game_type"] = "Omaha" : @fields["game_type"] = "HE"
		end
	end
end