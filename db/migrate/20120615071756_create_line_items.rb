class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :invoice_id
      t.integer :quantity
      t.decimal :unit_cost
      t.float :tax
      t.integer :total
      t.integer :price_id

      t.timestamps
    end
  end
end
