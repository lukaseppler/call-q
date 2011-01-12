Given /^I registered as "([^"]*)" with password "([^"]*)"$/ do |email, pwd|
  Factory(:user, :email => email, :password => pwd)
end

Given /^I am logged in$/ do
  user = Factory.create(:user)
  visit new_user_session_path
  fill_in "Email", :with => user.email
  fill_in "Password", :with => user.password
  click_button "Sign in"
end
