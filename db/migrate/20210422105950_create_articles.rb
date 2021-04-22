class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :category_id
      t.integer :status_id
      t.integer :delivery_charge_id
      t.integer :shipment_source_id
      t.integer :day_to_ship_id
      t.timestamps
    end
  end
end
