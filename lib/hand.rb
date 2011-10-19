class Hand
	attr_accessor :fields

	def self.get_unprocessed_hand_id
		$redis.lpop("unprocessed:hand")
	end

	def self.delete_hand id
		$redis.del id
	end
	
	def self.get_val id, key
		$redis.hget(id, key)
	end

	def initialize
		reset
	end

	def add_action name, val
		@actions[name].push(val)
	end

	def add_to_seat seat, name, val
		case name
		when "player_id"
			idx = 0
		when "stack"
			idx = 1
		when "hole_cards"
			idx = 2
		when "result"
			idx = 3
		end
		if @seats[seat] 
			@seats[seat].insert(idx, val)
		else 
			@seats[seat] = [val]
			@seated += 1
		end
	end

	def reset
		@fields, @seats, @seated = {}, {}, 0
		@actions = {"action_preflop" => [], "action_flop" => [], "action_turn" => [], "action_river" => []}
	end

	def add_fields
		@fields.push("seated").push(@seated) unless @fields.include?("seated")
	end
	
	def add_lists
		@fields.flatten!
		@seats.each {|k,v| @fields.push(k).push(v.to_s)}
		@actions.each {|k,v| @fields.push(k).push(v.to_s)}
	end

	def write
		if @fields.count > 0
			hand_id = @fields['hand_id']
			@fields = Formatter.get(@fields).to_a
			add_fields
			add_lists
			id = hand_id
			$redis.rpush("unprocessed:hand", "hand:#{id}")
			$redis.hmset("hand:#{id}", *@fields) 
			reset
		end
	end
end