class RemovePaymentTypeWaitList < ActiveRecord::Migration
  def up
    remove_column :wait_lists,:payment_type
  end

  def down
    add_column :wait_lists, :payment_type, :string, :length=>10
  end
end
