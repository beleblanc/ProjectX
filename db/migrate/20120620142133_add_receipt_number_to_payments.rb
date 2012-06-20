class AddReceiptNumberToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :eft_number, :string, :length => 10
  end
end
