class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      sql = "name ILIKE :query
      OR category ILIKE :query
      OR address ILIKE :query
      "
      @events = Event.where(sql, query: "%#{params[:search][:query]}%")
    else
      @events = Event.all
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
      if @event.save
        redirect_to event_path(@event)
      else
        render :new
      end
  end

  def edit
  end

  def update
    @event.update(event_params)
    if @event.save
     redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end


  private

  def event_params
    params.require(:event).permit(:name, :address, :description, :category, :starts_at, :ends_at, :capacity, :photo)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
