class LabOrder < ActiveRecord::Base

  attr_accessible :lab_test_id, :soap_id, :user_id, :comment
  belongs_to :soap
  belongs_to :lab_test
  belongs_to :user
  
  validates_uniqueness_of :lab_test_id, scope: :soap_id, message: "Can only have one test of each type per SOAP"
end
