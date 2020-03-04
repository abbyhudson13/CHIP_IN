CATEGORIES = ["Poverty", "Women & Families", "Refugees", "Children", "Animals", "Environment", "Elderly", "Education"]

class Event < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :users, through: :requests
  has_one_attached :photo
  validates :photo, attached: true
end
