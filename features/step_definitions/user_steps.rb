Given /^I registered as "([^"]*)" with password "([^"]*)"$/ do |email, pwd|
  Factory(:user, :email => email, :password => pwd)
end
