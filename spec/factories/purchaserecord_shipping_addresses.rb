FactoryBot.define do
  factory :purchaserecord_shipping_address do
    post_code    { '123-4567' }
    prefecture_id  { 2 }
    city           { '渋谷区' }
    street         { '1-1' }
    building       { 'テストビル' }
    phone_number   { '09012345678' }
    token          { 'tok_4242424242424242' }
  end
end

