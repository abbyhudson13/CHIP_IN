class Event < ApplicationRecord
  CATEGORIES = ["Poverty", "Women & Families", "Refugees", "Children", "Animals", "Environment", "Elderly", "Education"]
  belongs_to :user
  has_many :requests
  has_many :users, through: :requests
  has_one_attached :photo

  def starts_at_formatted
    starts_at.strftime('%A, %d %b %Y %l:%M %p')
  end

  def ends_at_formatted
    ends_at.strftime('%A, %d %b %Y %l:%M %p')
  end
end
