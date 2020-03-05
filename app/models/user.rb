class User < ApplicationRecord
  enum role: [:Charity, :Volunteer]
  has_many :requests, dependent: :destroy
  has_many :events, dependent: :destroy
  has_one_attached :photo
  # validates :photo, attached: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
