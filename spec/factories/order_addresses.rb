FactoryBot.define do
  factory :order_address do
    item_id                 { 1 }
    user_id                 { 1 }
    postal_code             { '123-4567' }
    prefecture_id           { 2 }
    municipality            { '横浜市緑区' }
    house_number            { '青山1-1-1' }
    building_name           { '柳ビル103' }
    phone_number            { 12_345_678_901 }
    token                   { 'tok_abcdefghijk00000000000000000' }
  end
end
