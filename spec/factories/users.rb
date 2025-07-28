FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname { Faker::Name.first_name }
    last_name { '山田' }
    first_name { '太郎' }
    first_name_reading { 'タロウ' }
    last_name_reading { 'ヤマダ' }
    birth_date { Faker::Date.backward(days: 36_500) }
  end
end
