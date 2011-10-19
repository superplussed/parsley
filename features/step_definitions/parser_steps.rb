TEST_PATH = "./files/hh"

Given /^a hand history file named "(.*)"$/ do |fn|
	@fn = fn
	@parsley = Parsley.new
  @parsley.scan("#{TEST_PATH}/#{@fn}.txt")  
end

When /^it is parsed and formatted$/ do
	@id = Hand.get_unprocessed_hand_id
end

Then /^the (.*) should be equal to (.*)$/ do |field, value|
	Hand.get_val(@id, field).should == value.to_s
end

After do |scenario|
  Hand.delete_hand @id
end
