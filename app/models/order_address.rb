class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly'}
    validates :municipality
    validates :house_number
    validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: 'Input only number' }
  end
  validates :prefecture, numericality: {other_than: 1, message: 'Select'}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end