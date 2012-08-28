class Payment < ActiveRecord::Base
  attr_accessible :amount, :invoice_id, :notes, :payment_date, :payment_type_id, :user_id , :eft_number
  belongs_to :invoice

  before_save :check_remaining_balance



  protected
  def check_remaining_balance
    if self.invoice.payments.sum(:amount) >= self.invoice.total
      self.invoice.payment_date = self.payment_date
      self.invoice.save
    end
  end
end
