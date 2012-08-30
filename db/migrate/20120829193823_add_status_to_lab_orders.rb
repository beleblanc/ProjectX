class AddStatusToLabOrders < ActiveRecord::Migration
  def change
    add_column :lab_orders, :status, :int
  end
end
