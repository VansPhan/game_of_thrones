class Character < ApplicationRecord
	belongs_to :house
	validates :name, presence: true
	validates :img_url, presence: true
end
