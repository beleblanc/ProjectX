class Soap < ActiveRecord::Base
  attr_accessible :comment, :consultation_id, :soap_type_id, :user_id

  has_many :vitals
  has_many :orders
  has_many :diagnoses

  belongs_to :consultation
  belongs_to :soap_type

end
