class PagesController < ApplicationController
  def home
    @events = Event.select do |event|
      event.starts_at >= Date.today
    end
  end

  def dashboard
    if @user = current_user
      if @user.role == "Volunteer"
        @future_requests = @user.requests.select do |request|
          request.event.starts_at > Date.today
        end
        @past_requests = @user.requests.select do |request|
          request.event.starts_at < Date.today
        end
      elsif @user.role == "Charity"
        @events = @user.events
      end
    end
  end
end
