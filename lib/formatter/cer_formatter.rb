module Formatter
	class CerFormatter < DefaultFormatter

		def create_time_field
			date, time = @fields["date_played"].split("-"), @fields["time_played"].split(":")
			@fields["time_played"] = Time.new(date[0].to_i, date[1].to_i, date[2].to_i, time[0].to_i, time[1].to_i, time[2][0..1].to_i)
		end

		def small_blind val
			@fields["small_blind"] = @fields["big_blind"].to_f / 2
		end

		def game_type val
			if val.include?"(1 on 1)" then
				@fields["table_max"] = 2
				val.gsub!("(1 on 1)", "")
			end
			game_type = val.slice!(/\w+/)
			case val.strip!
			when "Pot Limit"
				limit_type = "PL"
			when "No Limit"
				limit_type = "NL"
			else
				limit_type = "FL"
			end
			 @fields["limit_type"] = limit_type
			game_type.eql?("Holdem") ? @fields["game_type"] = "HE" : @fields["game_type"] = "Omaha"
		end
	end                     
end