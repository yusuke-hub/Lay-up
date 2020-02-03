FactoryBot.define do
  factory :user do
      profile_image {'business-man.jpg'}
      account_id {'11111111'}
      email {'test1@test.com'}
      password  {'111111'}
      name {'田中太郎'}
      phone_number {'111-1111-1111'}   
      trait :no_name do
        name{}
      end
      trait :no_phone_number do
        phone_number{}
      end
      trait :no_account_id do
        account_id{}
      end
      trait :too_short_account_id do
        account_id{Faker::Lorem.characters(number: 7)}
      end
      trait :too_long_account_id do
        account_id{Faker::Lorem.characters(number: 13)}
      end
      trait :create_with_plans do
        after(:create) do |user|
          create_list(:plan, 3, user: user)
        end
      end
  end
end