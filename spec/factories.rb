Factory.define :user do |u|
  u.sequence(:email) { |n| "bob#{n}@example.com" }
  u.password "somepass"
  u.password_confirmation { |u| u.password }
end
