STATUS = ['1', '2', '3','4']
validates_

class Request < ApplicationRecord
  validates :status, inclusion: {in: [1,2,3,4]}
end

  belongs_to :user
  belongs_to :event


end
