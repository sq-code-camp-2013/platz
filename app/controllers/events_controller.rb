class EventsController < ApplicationController
  before_filter :require_login

  def index
    @events = current_user.events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    @event.creator = current_user
    if @event.save
      redirect_to events_url, :notice => "Event Created!"
    else
      render "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id]) 
    if @event.update_attributes(params[:event])
      redirect_to events_url, :notice => "Event Updated!"
    else
      render "edit"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
  end
end
