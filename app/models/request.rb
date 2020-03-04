class Request < ApplicationRecord
  enum status: [:pending, :confirmed, :declined, :cancelled ]
  # validates :status, inclusion: {in: [0,1,2,3]}
  belongs_to :user
  belongs_to :event
end
