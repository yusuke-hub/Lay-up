class Plan < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :user
	validates :departure, presence: true
	validates :shelter, presence: true	
	validates :distance, presence: true
	validates :duration, presence: true
end
