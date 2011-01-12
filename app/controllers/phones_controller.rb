class PhonesController < ApplicationController
  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.new(params[:phone])
    @phone.save
    redirect_to @phone, :notice => "Phone number has been stored"
  end

  def show
    @phone = Phone.find(params[:id])
  end
end
