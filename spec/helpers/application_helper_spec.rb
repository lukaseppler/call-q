require 'spec_helper'

describe ApplicationHelper do
  describe "#formatted_phone" do
    it "returns an international formatted phone" do
      phone = helper.formatted_phone "4111111111"
      phone.should == "+41 11 111 11 1"
    end
  end
end
