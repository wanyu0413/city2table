class Review < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :comments, :rating, presence: true
end
