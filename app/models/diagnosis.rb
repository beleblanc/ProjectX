class Diagnosis < ActiveRecord::Base

  attr_accessible :comments, :icd_id, :soap_id, :time, :user_id
  belongs_to :soap
  belongs_to :icd
end
