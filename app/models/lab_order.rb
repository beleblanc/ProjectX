class LabOrder < ActiveRecord::Base

  attr_accessible :lab_test_id, :soap_id, :user_id

  has_many :lab_tests
end
