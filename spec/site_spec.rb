require 'spec_helper'

describe Site do
	before (:each) {Site.load_hh_identifiers!}
	describe "find_from_hh" do
	  it "should return the correct site id" do
	    Site.find_from_hh("PokerStarsGame").should == "PST"
	  end
	end
end