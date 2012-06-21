class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :invoice_id
      t.text  :notes
      t.date :payment_date
      t.decimal :amount
      t.string :payment_type_id
      t.integer :user_id
    end
  end
end
