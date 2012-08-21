module ErrorLog
	def self.parser_invalid_hand hand_id
		raise("\n**** INVALID HAND " << hand_id << "\n\n") if !hand_id.nil?
	end
	
	def self.parser_unmatched_line(current_state, line)
		raise("\n**** unmatched " << current_state << " for line '" << line << "'\n\n") 
	end
	
	def self.report klass, value, attribute
		str = "#{value} is an invalid #{attribute}"
		self.send_raise(klass, str)
	end
	
	def self.send_raise klass, str
		klass_name = klass.kind_of?(String) ? klass : klass.class
		str = "#{klass_name}: #{str}"
		raise str
	end
end