class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :day_to_ship

  validates :image, presence: true
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range' }
  validates :category_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :status_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :shipment_source_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :day_to_ship_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  
end
