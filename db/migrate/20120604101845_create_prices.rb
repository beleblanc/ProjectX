class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :price
      t.integer :medical_aid_id
      t.belongs_to :priceable, polymorphic: true
    end

    add_index :prices, [:priceable_id,:priceable_type]
  end
end
