require 'spec_helper'
describe NotesController do
  describe "POST create" do
    let(:phone) { Phone.create!(:number => "123 456 7890") }

    before(:each) do
      post :create, :phone_id => phone.id, :note => { :content => "Testing" }
      phone.reload
    end

    it "creates a note for a phone number" do
      phone.should have(1).note
      phone.notes.first.content.should == "Testing"
    end

    it "redirects to the phone" do
      response.should redirect_to(phone_path(phone))
    end
  end
end
