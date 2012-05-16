class Soap < ActiveRecord::Base
  attr_accessible :comment, :consultation_id, :soap_type_id, :user_id, :vitals_attributes

  has_many :vitals
  has_many :orders
  has_many :diagnoses

  belongs_to :consultation
  belongs_to :soap_type

  accepts_nested_attributes_for :vitals

end
