class Group < ApplicationRecord
  has_many :belongings, dependent: :destroy
  has_many :users, :through => :belongings
  accepts_nested_attributes_for :belongings, allow_destroy: true
  validates :name, presence: true
  validates :caption, presence: true, length: { minimum: 6, maximum: 30}
end
