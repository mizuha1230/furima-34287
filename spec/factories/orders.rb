FactoryBot.define do
  factory :order do
    postal_code             { '123-4567' }
    prefecture_id           { 2 }
    municipality            { '横浜市緑区' }
    house_number            { '青山1-1-1' }
    building_name           { '柳ビル103' }
    phone_number            { 12345678901 }
    user_id                 { user_id }
    item_id                 { item_id }
    association :user
    association :item
  end
    
end
