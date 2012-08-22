class Soap < ActiveRecord::Base
  attr_accessible :comment, :consultation_id, :soap_type_id, :user_id, :vitals_attributes

  has_many :vitals

  has_many :diagnoses
  has_many :prescriptions
  has_many :lab_orders
  belongs_to :consultation
  belongs_to :soap_type

  accepts_nested_attributes_for :vitals , :allow_destroy => true ,:reject_if => :all_blank

end
