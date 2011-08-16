class Parser
	
	require 'Yajl'
	REGEXES_PATH = "files/regex/"
	
	def initialize state, hand
		@state, @hand = state, hand
	end

	def parse line
		@matched = false
		results = match_line(line, @state.get_state_definition("regex"))
		process_matches(results) if results
		@state.update(@matched)	
	end

	def match_line line, regex
		regex.each{ |re| 
			match = re.match(line)
			return match if match
		}
		nil
	end

	def process_matches results
		@matched = true
		results.names.each { |name| 
			add_fields_to_hand(name, results[name]) 
		} 
	end

	def add_fields_to_hand name, val
		if name.eql?("board")
			cards = val.split
			@hand.fields["cards_flop"] = cards[0..2].join(" ")
			@hand.fields["cards_turn"] = cards[3]
			@hand.fields["cards_river"] = cards[4]
		else
			@hand.fields[name] = val
		end
	end

	def format_seat seat
		"s#{seat}"
	end
	
	def format_money amt
		amt.sub(",", "").to_f
	end
end


class ParserForActionState < Parser
	
	def load_definitions site_id
		@site_id = site_id
		@action_subs = @state.get_root_definition("action_subs")
	end
	
	def parse line
		@matched = false
		results = match_line(line, @state.get_next_regex)
		results ? @state.next : results = match_line(line, @state.get_state_definition("regex"))
		process_matches results if results
		@state.update(@matched)	
	end
	
	def format string
		@action_subs.each { |re|
			results = re.match(string)
			if results
				action = results["action"].downcase
				action[0].eql?("c") ? action = action[0..1] : action = action[0]
				ary = [results["player_id"], action]
				ary.push(results["wager"].to_f) if results.names.include?("wager") 
				return ary 
			end
		}
		return nil
	end
	
	def add_fields_to_hand name, val
		action_array = format(val)
		@hand.add_action(name, action_array) if action_array
	end
end


class ParserForSeatsState < Parser
	def add_fields_to_hand name, val
		name.eql?("seat_num") ? @seat_num = format_seat(val) : @hand.add_to_seat(@seat_num, name, val)
	end
end