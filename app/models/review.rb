class Review < ApplicationRecord
  belongs_to :course

  validates :comments, :rating, presence: true
end
