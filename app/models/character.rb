class Character < ApplicationRecord
	belongs_to :house
	has_many :traits, dependent: :destroy
	validates :name, presence: true
	validates :img_url, presence: true
end