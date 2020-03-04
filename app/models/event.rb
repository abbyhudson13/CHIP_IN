class Event < ApplicationRecord
  CATEGORIES = ["Poverty", "Women & Families", "Refugees", "Children", "Animals", "Environment", "Elderly", "Education"]
  belongs_to :user
  has_many :requests
  has_many :users, through: :requests
  has_one_attached :photo
  validates :photo, attached: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def starts_at_formatted
    starts_at.strftime('%A, %d %b %Y %l:%M %p')
  end

  def ends_at_formatted
    ends_at.strftime('%A, %d %b %Y %l:%M %p')
  end
end
