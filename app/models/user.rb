class User < ApplicationRecord
  has_many :courses
  has_many :bookings
  has_many :bookings_as_owner, through: :courses, source: :bookings
  has_many :reviews, through: :courses
  validates :first_name, :last_name, :speciality, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
