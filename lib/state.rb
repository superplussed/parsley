class State
	require 'Yajl'
	REGEXES_PATH = "files/regex/"

  attr_accessor :summary_header, :name, :matched
 
	def initialize
		@states_list, @json_hash, @current_state_index, @matched, @summary_header, @state_after_summary = [], {}, 0, false, nil, nil
  	update_name
	end

	def load_definitions site_id
		load_json site_id
		build_states_list
		@summary_header = get_root_definition("summary_header")
		@state_after_summary = get_root_definition("state_after_summary")
		update_name
	end

	def get_state_definition field
		@json_hash[@name][field] || ErrorLog.report(self, "[#{@name}][#{field}]", "field")
	end
	
	def get_root_definition state
		@json_hash[state] || ErrorLog.report(self, state, "definition")
	end
	
	def get_next_regex
		@json_hash[@states_list[@current_state_index + 1]]["regex"]
	end

	def criteria_exists?(field, value)
		@json_hash[@name][field].eql?(value) ? true : false
	end

	def update_name	
		@name = @states_list[@current_state_index]	
	end
	
  def next
    @current_state_index += 1
		update_name
  end

	def reset_current
    @current_state_index = 0 
		@matched = false
		update_name
	end
	
	def go_to_summary
		@matched = true
		@current_state_index = @states_list.index(@state_after_summary)
		update_name
	end

	def update matched
	 	@matched = matched
		self.next if ((@matched && criteria_exists?(:match, :once)) || !@matched)
	end
	
	private
	
	def load_json site_id
		json = File.open(regex_path(site_id))
    @json_hash = Yajl::Parser.new.parse(json)
		initialize_regexes
	end

	def initialize_regexes
		@json_hash.each {|line| 
			@json_hash[line[0]]["regex"] = @json_hash[line[0]]["regex"].map{|re| Regexp.new(re)} if (line[1].kind_of?(Hash) && @json_hash[line[0]]["regex"].kind_of?(Array))
		}
		@json_hash["action_subs"] = @json_hash["action_subs"].map{|re| Regexp.new(re)}
	end
	
	def build_states_list
		@states_list = @json_hash.keys[begin_state_index, end_state_index]
	end
	
	def begin_state_index
		@json_hash.keys.index("begin_state_list") + 1
	end

	def end_state_index
		@json_hash.keys.count
	end
	
	def regex_path site_id
		File.join(File.dirname(__FILE__), REGEXES_PATH, "#{site_id}.json")
	end
	
end