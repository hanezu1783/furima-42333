FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    transient do
      pw { ([*'a'..'z', *'A'..'Z'].sample + rand(0..9).to_s + Faker::Alphanumeric.alphanumeric(number: 4)).chars.shuffle.join }
    end
    password { pw }
    password_confirmation { pw }
    nickname { Faker::Name.first_name }
    last_name { '山田' }
    first_name { '太郎' }
    first_name_reading { 'タロウ' }
    last_name_reading { 'ヤマダ' }
    birth_date { Faker::Date.backward(days: 36_500) }
  end
end
