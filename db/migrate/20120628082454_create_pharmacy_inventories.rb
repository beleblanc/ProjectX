class CreatePharmacyInventories < ActiveRecord::Migration
  def change
    create_table :pharmacy_inventories do |t|
      t.string :name
      t.text :description
      t.integer :stock_on_hand
      t.integer :reorder_level
      t.date :expiry_date

      t.timestamps
    end
  end
end
