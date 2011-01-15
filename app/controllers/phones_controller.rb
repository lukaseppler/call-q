class PhonesController < ApplicationController
  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.new(params[:phone])
    if @phone.save
      redirect_to @phone
    else
      render 'new'
    end
  end

  def show
    @phone = Phone.find(params[:id])
  end

  def update
    @phone = Phone.find(params[:id])
    @phone.update_attributes(params[:phone])
    redirect_to @phone, :notice => "Phone information was succesfully updated"
  end

  def search
    query = params[:q]
    @phone = Phone.search(query).first

    if @phone
      redirect_to @phone
    else
      redirect_to(new_phone_path, :alert => "Phone wasn't found")
    end
  end
end
