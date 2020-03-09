class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewee, class_name: "User"
  validates :rating, presence: :true

  def blank_stars
    5 - rating.to_i
  end
end
