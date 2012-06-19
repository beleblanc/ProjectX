class Invoice < ActiveRecord::Base
  has_many :line_items
  belongs_to :consultation
  belongs_to :person
  belongs_to :person_medical_aid

  attr_accessible :invoice_date, :total, :discount, :payment_date, :submitted_for_claim, :line_items_attributes, :consultation_id, :person_medical_aid_id, :person_id

  accepts_nested_attributes_for :line_items, :allow_destroy => true

  def build_line_items
    self.invoice_date = Date.today
    self.consultation.orders.all.each do |order|
      line = {:quantity => 1.0, :unit_cost => order.price, :total => order.price, :description => "#{order.department_operation.name} - #{order.department_operation.code}"}
      self.line_items.new(line)
    end
    self.total = self.line_items.calculate(:sum, :total)
  end

end
