class HandReader
	attr_accessor :hand_ids

  def initialize 
		@state, @hand = State.new, Hand.new
		@default_parser, @seats_parser, @action_parser, @new_hand = Parser.new(@state, @hand), ParserForSeatsState.new(@state, @hand), ParserForActionState.new(@state, @hand), true
  end

	def begin_hand line
		initialize_site(line)
		@state.reset_current
	end

  def read line
		begin_hand(line) if line && @new_hand
		parse(line)
  end

	def end_hand
		@hand.write
		@new_hand = true
	end 

  private

	def initialize_site(line)
    new_site = Site.find_from_hh(line.split[0..1].join)
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