STATUS = ['1', '2', '3','4']

class Request < ApplicationRecord
  validates :status, inclusion: {in: [1,2,3,4]}
  belongs_to :user
  belongs_to :event


end
