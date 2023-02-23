class Booking < ApplicationRecord
  belongs_to :course
  belongs_to :user
  validates :start_time, presence: true
  enum status: { pending: 0, accepted: 1, rejected: 2 }
end
