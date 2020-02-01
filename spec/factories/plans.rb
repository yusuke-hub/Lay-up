FactoryBot.define do
  factory :plan do
    departure { '東京都千代田区丸の内1丁目5−1' }
    shelter { '東京都千代田区皇居外苑' }
    distance { 728 }
    duration { 9 }
    user
  end
end