class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :soaps_id
      t.integer :department_operations_id
      t.text :comments
      t.datetime :time
      t.integer :user_id

      t.timestamps
    end
  end
end
