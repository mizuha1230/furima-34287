class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :day_to_ship

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
