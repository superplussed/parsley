class HandReader
	attr_accessor :hand_ids

  def initialize 
		@state, @hand = State.new, Hand.new
		@default_parser, @seats_parser, @action_parser, @new_hand = Parser.new(@state, @hand), ParserForSeatsState.new(@state, @hand), ParserForActionState.new(@state, @hand), true
  end

  def read line
		valid_site_found = begin_hand(line) if @new_hand
		parse(line) if !@new_hand || valid_site_found
  end

	def end_hand
		@hand.write
		@new_hand = true
	end 

  private

	def begin_hand line
		new_site = Site.find_from_hh(line.split[0..1].join)
		if (new_site)
			initialize_site(new_site)
			@state.reset_current
			return true
		end
		return false
	end
	
	def initialize_site new_site
		if new_site != @site_id 
			@site_id = new_site
			@state.load_definitions(@site_id)
			@action_parser.load_definitions(@site_id)
		end
		@hand.fields["site_id"] = @site_id
		@new_hand = false
	end

	def parse line
		@state.matched = false
		while !@state.matched
			if @state.summary_header.eql?(line)
				@state.go_to_summary 
			else
				case @state.name
					when "action_preflop", "action_flop", "action_turn", "action_river"; @action_parser.parse(line)
					when "seats", "summary"; @seats_parser.parse(line)
					else @default_parser.parse(line)
				end
			end
		end
	end
end          