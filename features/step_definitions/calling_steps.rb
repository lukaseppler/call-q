When /^I call "([^"]*)"$/ do |number|
  visit new_phone_path
  fill_in "phone_number", :with => number
  click_button "Call"
end
