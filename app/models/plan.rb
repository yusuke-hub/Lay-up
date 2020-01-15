class Plan < ApplicationRecord
	has_many :comments
	belongs_to :user
	belongs_to :situation
end
