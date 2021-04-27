class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :day_to_ship

  with_options presence: true do
    validates :image
    validates :product_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :shipment_source_id
    validates :day_to_ship_id
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :shipment_source_id
    validates :day_to_ship_id
  end
end
