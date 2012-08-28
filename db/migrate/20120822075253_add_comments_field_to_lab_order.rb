class AddCommentsFieldToLabOrder < ActiveRecord::Migration
  def change
    add_column :lab_orders, :comment, :text
  end
end
