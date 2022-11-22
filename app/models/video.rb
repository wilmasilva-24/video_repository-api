class Video < ApplicationRecord
	belongs_to :user
	belongs_to :category
	validates :name, presence: true
	validates :url, presence: true
end
