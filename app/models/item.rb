class Item < ApplicationRecord
  has_one_attached :image

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :status_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 }
  validates :shipment_source_id, presence: true, numericality: { other_than: 1 }
  validates :day_to_ship_id, presence: true, numericality: { other_than: 1 }
  with_options presence: true, numericality: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/, message: 'Half-width number' } do
    validates :price
  end
end
