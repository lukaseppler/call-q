class PhonesController < ApplicationController
  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.new(params[:phone])
    @phone.save
    redirect_to @phone
  end

  def show
    @phone = Phone.find(params[:id])
  end

  def update
    @phone = Phone.find(params[:id])
    @phone.update_attributes(params[:phone])
    redirect_to @phone, :notice => "Phone information was succesfully updated"
  end
end
