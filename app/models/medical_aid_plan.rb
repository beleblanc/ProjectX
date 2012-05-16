class MedicalAidPlan < ActiveRecord::Base
  attr_accessible  :plan_name

  belongs_to :medical_aid, :foreign_key => :medical_aids_id ,:primary_key => :id
  belongs_to :person_medical_aid, :foreign_key => :medical_aids_id, :primary_key => :medical_aids_id
end
