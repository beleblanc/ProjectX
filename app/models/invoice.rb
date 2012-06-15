class Invoice < ActiveRecord::Base
  has_many :line_items
  belongs_to :consultation
  belongs_to :person
  belongs_to :person_medical_aid
  
  attr_accessible :invoice_date, :total, :discount, :payment_date, :submitted_for_claim,:line_items_attributes

  accepts_nested_attributes_for :line_items, :allow_destroy => true 

end
