class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :item_id, :user_id
end