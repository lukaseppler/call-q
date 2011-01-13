class NotesController < ApplicationController
  def create
    @phone = Phone.find(params[:phone_id])
    @phone.notes.create!(params[:note])
    redirect_to @phone, :notice => "Note was created. Keep describing!"
  end
end
