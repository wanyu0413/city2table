class Booking < ApplicationRecord
  belongs_to :course
  belongs_to :user
  validates :start_time, :end_time, presence: true
  enum status: { pending: "pending", accepted: "accepted", rejected: "rejected" }
end
