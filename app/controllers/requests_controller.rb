class RequestsController < ApplicationController
  before_action :set_event, only: [:new, :create, :edit, :update]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.event = @event
    @request.user = current_user
    @request.status = 1
    #this is for the moment hardcoded. We need to implement the if statement. TO DO
    if @request.save
       redirect_to root_path
       # need to be change when dashboard is available
     else
      render :new
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update

    @request = Request.find(params[:id])

    @request.update(request_params)
    redirect_ root_path
    redirect_to event_path(@event)
  end


  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to root_path

    # need to be change when dashboard is available

  end

  private

  def request_params
    params.require(:request).permit(:message)
  end
  def set_event
    @event = Event.find(params[:event_id])

  end

end
