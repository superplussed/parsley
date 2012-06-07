module Formatter
	class Formatter::DefaultFormatter

		attr_accessor :fields
	
		def initialize fields
			@fields = fields
			create_time_field
			format(["table_max", "game_type", "small_blind", "button"])
			format(["table_type", "max_bb", "currency", "cash_game"])
			@fields
		end
	
		def create_time_field
			date, time = @fields["date_played"].split("/"), @fields["time_played"].split(":")
			@fields["time_played"] = Time.new(date[0].to_i, date[1].to_i, date[2].to_i, time[0].to_i, time[1].to_i, time[2][0..1].to_i)
		end
	
		def button val
			@fields["button"] = "s#{@fields["button"]}"
		end
	
		def max_bb val
			val || @fields["max_bb"] = 100
		end

		def table_type val
			val || @fields["table_type"] = "normal"
		end

		def currency val
			val || @fields["currency"] = "USD"
		end

		def table_max val
			val || @fields["table_max"] = 9
		end

		def format ary
			ary.each { |field| send(field, @fields[field]) if self.respond_to?(field) }
		end
	end
end