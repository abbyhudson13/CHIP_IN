class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @future_requests = @user.requests.select do |request|
      request.event.starts_at > Date.today
    end
    @past_requests = @user.requests.select do |request|
      request.event.starts_at < Date.today
    end

  end
end
