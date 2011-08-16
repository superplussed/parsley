module Formatter
	class PstFormatter < DefaultFormatter

		def table_max val
			case val 
			when "2-max"
				val = 2
			when "6-max"
				val = 6
			else
				val = 9
			end
			@fields["table_max"] = val
		end

		def game_type val
			val.sub!("'", '') unless val.nil?
			game_type = val.slice!(/\w+/)
			case val.strip!
			when "Pot Limit"
				@fields["limit_type"] = "PL"
			when "Limit"
				@fields["limit_type"] = "FL"
			else
				@fields["limit_type"] = "NL"
			end
			game_type.eql?("Omaha") ? @fields["game_type"] = "Omaha" : @fields["game_type"] = "HE"
		end
	end
end