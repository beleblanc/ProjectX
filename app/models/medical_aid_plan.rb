class MedicalAidPlan < ActiveRecord::Base
  attr_accessible :medicalAid_id, :plan_name
  belongs_to :medical_aids
end
