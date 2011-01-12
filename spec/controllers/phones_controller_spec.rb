require 'spec_helper'

describe PhonesController do
  def mock_phone(stubs = {})
    @mock_phone ||= mock_model(Phone, stubs).as_null_object
  end

  describe "GET new" do
    it "assigns a new phone as @phone" do
      get :new
      assigns(:phone).should be
    end
  end

  describe "GET show" do
    before do
      @phone = Phone.create!(:number => '231 456 7890')
    end

    it "assigns the requested number as @phone" do
      Phone.should_receive(:find).with(mock_phone.id).and_return(mock_phone)
      get :show, :id => mock_phone.id
      assigns(:phone).should == mock_phone
    end
  end

  describe "POST create" do
    context "given a valid phone number" do
      before(:each) do
        @phone = { :number => '123 456 7890'}
      end

      it "stores it on the backend" do
        expect {
          post :create, :phone => @phone
        }.to change(Phone, :count).by(1)
      end

      it "sets the flash" do
        post :create, :phone => @phone
        flash[:notice].should =~ /Phone number has been stored/
      end

      it "redirects to the show page"
    end
  end


end
