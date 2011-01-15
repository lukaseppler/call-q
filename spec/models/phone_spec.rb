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

  it "contains notes for the phone number" do
    phone = Phone.create!(:number => '123789456')
    phone.notes.create!(:content => 'A sample note')
    phone.save
    phone.reload
    phone.should have(1).note
    phone.notes.first.content.should == 'A sample note'
  end

  context "valid" do
    it "with a number containing digits, plus sign parentheses and spaces" do
      phone = Phone.new(:number => '456 903 4567')
      phone.should be_valid
    end
  end

  context "invalid" do
    it "with a number that contains all letters and no numbers" do
      phone = Phone.new(:number => 'AAAAAXXXXX')
      phone.should_not be_valid
    end
  end
end
