TEST_PATH = "/Users/jeremysmith/code/parsley/files/hh"

Given /^a hand history file named "(.*)"$/ do |fn|
	#$redis.flushall
	@fn = fn
	@parser = Parsley.new("#{TEST_PATH}/#{@fn}.txt")  
end

When /^it is parsed and formatted$/ do
	@id = Hand.get_hand_id(@fn)[0]
end

Then /^the (.*) should be equal to (.*)$/ do |field, value|
	Hand.get_val(@id, field).should == value.to_s
end
