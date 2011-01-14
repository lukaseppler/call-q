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

      it "redirects to the show page" do
        post :create, :phone => @phone
        response.should redirect_to(phone_path(normalized_phone @phone[:number]))
      end
    end
  end

  describe "PUT update" do
    before do
      @number = Phone.create(:number => "123 567 9804")
      attrs =  { 'name' => 'Jane Doe' }
      put :update, :id => @number.id, 'phone' => attrs
    end

    it "updates the name for a phone number" do
      @number.reload
      @number.name.should == 'Jane Doe'
    end

    it "redirects to the phone page" do
      response.should redirect_to(phone_path(@number))
    end

    it "sets the flash" do
      flash[:notice].should =~ /Phone information was succesfully updated/
    end
  end


end
