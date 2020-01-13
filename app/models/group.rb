class Group < ApplicationRecord
  has_many :add_user_to_groups, dependent: :destroy
  has_many :users, :through => :add_user_to_groups
  accepts_nested_attributes_for :add_user_to_groups, allow_destroy: true
  validates :name, presence: true
  validates :caption, presence: true, length: { minimum: 6, maximum: 30}
end
