def normalize_number(number)
  Phony.normalize(number)
end

def find_normalized_number(number)
  @phone = Phone.where(:number => normalize_number(number)).first
end

When /^I call "([^"]*)"$/ do |number|
  visit new_phone_path
  fill_in "phone_number", :with => number
  click_button "Call"
  find_normalized_number(number)
end

Then /^I should have (\d+) notes? on the phone number$/ do |count|
  @phone.should have(count.to_i).notes
end

Given /^I have no notes for "([^"]*)"$/ do |arg1|
end
