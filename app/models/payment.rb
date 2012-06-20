class Payment < ActiveRecord::Base
  attr_accessible :amount, :invoice_id, :notes, :payment_date, :payment_type_id, :user_id

  belongs_to :invoice
end
