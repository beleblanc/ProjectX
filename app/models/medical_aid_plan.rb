class MedicalAidPlan < ActiveRecord::Base
  attr_accessible  :name, :medical_aid_id

  belongs_to :medical_aid
  has_many :person_medical_aids
end
