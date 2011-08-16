require 'spec_helper'

describe State do
	
	before(:each) {
		@site_id = :PST
		@state = State.new
		@state.load_definitions(@site_id)
	}

	describe "#get_root_definition" do
		it "should load the proper definition" do
			@state.get_root_definition("site").should == "PokerStars"
		end
		it "should raise exception if it cannot load definition" do
			lambda{@state.get_root_definition("foo")}.should raise_error
		end
	end
	
	describe "#get_state_definition" do
		it "should load the proper definition" do
			@state.get_state_definition("match").should == "once"
		end
		it "should raise exception if it cannot load definition" do
			lambda{@state.get_state_definition("foo")}.should raise_error
		end
	end

	describe "#criteria_exists?" do
		it "should return true for current state when exists" do
			@state.criteria_exists?("match", "once").should be_true
		end

		it "should return false for current state when doesn't exist" do
			@state.criteria_exists?("match", "foo").should be_false
		end
	end
	
	describe "#next" do
		it "should advance state" do
			@state.next
			@state.name.should == "header2"
		end
	end
	
	describe "#reset_current" do
		it "should reset state" do
			@state.next
			@state.reset_current
			@state.name.should == "header1"
		end

		it "should reset matched" do
			@state.matched = true
			@state.reset_current
			@state.matched.should be_false
		end
	end
	
	describe "#go_to_summary" do
	  it "should set the current state to summary" do
	    @state.go_to_summary
			@state.name.should == "rake"
	  end
	end
end