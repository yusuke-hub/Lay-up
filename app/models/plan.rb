class Plan < ApplicationRecord
	has_many :comments
	belongs_to :user
	belongs_to :situation
	validates :d_name, presence: true
	validates :s_name, presence: true
	validates :distance, presence: true
	validates :memo, presence: true
end
