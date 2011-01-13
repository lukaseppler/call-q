require 'spec_helper'

describe Phone do
  it "normalizes the number before saving it" do
    number = '+41 76373 0787'
    phone_number = Phone.create(:number => number)
    phone_number.number.should == '41763730787'
  end

  it "sets the key as the normalized phone number" do
    number = "+123 456 7890"
    phone_number = Phone.create(:number => number)
    phone_number.id.should == '1234567890'
  end
end
