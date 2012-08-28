class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :comment
      t.integer :pharmacy_inventory_id
      t.integer :soap_id
      t.time :time
      t.integer :user_id
      t.decimal :price

      t.timestamps
    end
  end
end
