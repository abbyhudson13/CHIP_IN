CATEGORIES = ["Poverty", "Women & Families", "Refugees", "Children", "Animals", "Environment", "Elderly", "Education"]

class Event < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :users, through: :requests
  has_one_attached :photo
  validates :photo, attached: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
