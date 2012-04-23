class MedicalAidPlan < ActiveRecord::Base
  attr_accessible :medicalAid_id, :PlanName
  belongs_to :medical_aids
end
