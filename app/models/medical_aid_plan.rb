class MedicalAidPlan < ActiveRecord::Base
  attr_accessible :medicalAid_id, :plan_name
  belongs_to_many :person_medical_aids
  belongs_to :medical_aids
end
