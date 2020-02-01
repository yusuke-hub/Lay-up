FactoryBot.define do
  factory :user do
      profile_image {'business-man.jpg'}
      account_id {'11111111'}
      email {'test1@test.com'}
      password  {'111111'}
      name {'田中太郎'}
      phone_number {'111-1111-1111'}    
  end
end