class CreateLabOrders < ActiveRecord::Migration
  def change
    create_table :lab_orders do |t|
      t.references :lab_test
      t.references :soap
      t.references :user


      t.timestamps
    end
  end
end
