class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :plans
  has_many :belongings
  has_many :groups, :through => :belongings
  has_many :comments
  attachment :profile_image
  validates :name, presence: true,  length: { in: 2..10 }
  validates :phone_number, presence: true
  validates :account_id, presence: true, uniqueness: true, length: { in: 8..12 }
end
