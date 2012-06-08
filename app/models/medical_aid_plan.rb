class MedicalAidPlan < ActiveRecord::Base
  attr_accessible  :plan_name, :medical_aids_id

  belongs_to :medical_aid
  has_many :person_medical_aids
end
