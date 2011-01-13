When /^I call "([^"]*)"$/ do |number|
  @phone = Phony.normalize(number)
  visit new_phone_path
  fill_in "phone_number", :with => number
  click_button "Call"
end

Then /^I should have (\d+) notes? on the phone number$/ do |count|
  @phone.should have(count.to_i).notes
end
