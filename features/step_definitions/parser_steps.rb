Given /^a hand history file named "(.*)"$/ do |fn|
	#$redis.flushall
	@fn = fn
	@parser = HandHistoryParser.new(@fn)  
end

When /^it is parsed and formatted$/ do
	@id = Hand.get_hand_id(@fn)[0]
end

Then /^the (.*) should be equal to (.*)$/ do |field, value|
	Hand.get_val(@id, field).should == value.to_s
end