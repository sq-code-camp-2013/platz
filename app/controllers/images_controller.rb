class ImagesController < ApplicationController
  def create
    images.create(params[:image]) 
    redirect_to Event.find(params[:event_id]), :notice => "Photo Uploaded!"
  end

  private

  def images
    Event.find(params[:event_id]).images
  end
end
