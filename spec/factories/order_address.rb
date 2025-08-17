FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '渋谷区' }
    address { '1-1-1' }
    building { '渋谷マンション101' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { FactoryBot.create(:user).id }
    item_id { FactoryBot.create(:item).id }
  end
end
