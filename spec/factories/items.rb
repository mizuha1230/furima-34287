FactoryBot.define do
  factory :item do
    product_name              { 'test' }
    description               { 'testtest' }
    price                     { '1000' }
    category_id               { 2 }
    status_id                 { 2 }
    delivery_charge_id        { 2 }
    shipment_source_id        { 2 }
    day_to_ship_id            { 2 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
     end
    association :user
  end
end
