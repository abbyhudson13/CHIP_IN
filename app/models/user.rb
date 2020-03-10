class User < ApplicationRecord
  enum role: [:Charity, :Volunteer]
  has_many :requests, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :reviews_as_reviewer, class_name: "Review", foreign_key: :reviewer_id, dependent: :destroy
  has_many :reviews_as_reviewee, class_name: "Review", foreign_key: :reviewee_id, dependent: :destroy
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
