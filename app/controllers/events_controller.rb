class EventsController < ApplicationController
  before_filter :require_login

  def index
    @user = User.find_by_id(params[:user_id])
    if @user.present?
      @events = current_user.events
    else
      @events = Event.all
          Rails.logger.warn "***************"
          Rails.logger.warn @events.count
    end
    @created_events = current_user.created_events
  end


  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(params[:event])
    @event.creator = current_user
    if @event.save
      redirect_to user_events_url, :notice => "Event Created!"
    else
      render "new"
    end
  end

  def edit
    @event = current_user.created_events.find(params[:id])
  end

  def update
    @event = current_user.created_events.find(params[:id]) 
    if @event.update_attributes(params[:event])
      redirect_to user_events_url, :notice => "Event Updated!"
    else
      render "edit"
    end
  end

  def show
    @event = current_user.created_events.find(params[:id])
  end

  def destroy
    @event = current_user.created_events.find(params[:id])
    if @event.destroy
      notice = "Event Destroyed!"
    else
      notice = "Event could not be Destroyed!"
    end
    redirect_to user_events_url, :notice => notice
  end
  

  def attend
    @event = Event.find(params[:event_id])
    user = User.find(params[:user_id])
    @event.attendees << user
    if @event.save
      redirect_to user_events_url(current_user), :notice => "Attending Event!"
    else
      render "show"
    end
  end

  # def showall
  #   $i = 0
  #   $num_of_users = 
  #   while do
  #   end
  # end
end
