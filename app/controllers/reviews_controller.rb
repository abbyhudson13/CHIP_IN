class ReviewsController < ApplicationController
  before_action :set_user

  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.reviewer = current_user
    @review.reviewee = User.find(params[:user_id])
    if @review.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:rating, :message)
  end
end
