class Plan < ApplicationRecord
	has_many :comments
	belongs_to :user
	# belongs_to :situation
	validates :departure, presence: true
	validates :shelter, presence: true	
	validates :distance, presence: true
	validates :duration, presence: true
	validates :memo, presence: true
end
