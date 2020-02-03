FactoryBot.define do
  factory :plan do
    departure { '東京都千代田区丸の内1丁目5−1' }
    shelter { '東京都千代田区皇居外苑' }
    distance { 728 }
    duration { 9 }
    user
  end
  trait :no_departure do
    departure{}
  end
  trait :no_shelter do
    shelter{}
  end
  trait :no_deistance do
    deistance{}
  end
  trait :no_duration do
    duration{}
  end    
end