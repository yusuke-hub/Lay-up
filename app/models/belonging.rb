class Belonging < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :activation, inclusion: { in: [true, false] }
end
