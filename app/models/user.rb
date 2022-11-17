class User < ApplicationRecord
  has_many :videos
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
