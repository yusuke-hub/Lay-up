class Situation < ApplicationRecord
	has_many :plans
	enum status: { 自宅: 0, 会社:1,  学校:2,　外出中:3, 移動中: 4 }
end
