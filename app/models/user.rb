class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :comments
  has_many :plans
  has_many :Add_user_to_groups
  has_many :groups, :through => :add_user_to_groups
  accepts_nested_attributes_for :Add_user_to_groups,allow_destroy: true
  validates :name, presence: true
  validates :account_id, presence: true, uniqueness: true, length: { in: 8..12 }
end
