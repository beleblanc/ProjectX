class PersonMedicalAid < ActiveRecord::Base
  attr_accessible :person_id, :number, :medical_aid_plan_id, :status, :join_date

  belongs_to :person
  belongs_to  :medical_aid_plan

end
