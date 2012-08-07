class Invoice < ActiveRecord::Base
  before_save :final_calculation
  has_many :line_items, :dependent => :delete_all
  has_many :payments, :dependent => :delete_all
  belongs_to :consultation
  belongs_to :person
  belongs_to :person_medical_aid

  attr_accessible :invoice_date, :total, :discount, :payment_date, :submitted_for_claim, :line_items_attributes, :consultation_id, :person_medical_aid_id, :person_id

  accepts_nested_attributes_for :line_items, :allow_destroy => true

  def build_line_items
    self.invoice_date = Date.today
    self.build_order_items
    self.build_prescription_items
    self.total = self.line_items.sum(:total)
  end


 




end
