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

  def build_order_items
    self.consultation.orders.all.each do |order|
      line = {:quantity => 1.0, :unit_cost => order.price, :total => order.price, :description => order.department_operation.code_name}
      self.line_items.build(line)
    end
  end
 
  def build_prescription_items
    self.consultation.prescriptions.all.each do |prescription|
	line = {:quantity => 1.0, :unit_cost => prescription.price, :total => prescription.price, :description => prescription.pharmacy_inventory.name}
	self.line_items.build(line)
    end
  end

  def final_calculation
    self.line_items.each do |line|
      line.total = line.unit_cost * line.quantity
    end
    if self.discount
      self.total = self.line_items.sum(:total) * (1.0 -(self.discount / 100))
    else
      self.total = self.line_items.sum(:total)
    end

  end

end
