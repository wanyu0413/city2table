class Course < ApplicationRecord
  validates :category, :price, :name, presence: true
  belongs_to :user
  has_many :bookings
  has_many :reviews
end
