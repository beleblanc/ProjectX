class PersonMedicalAid < ActiveRecord::Base
  attr_accessible :person_id, :aid_number, :medical_aid_id, :status, :join_date

  belongs_to :person
  belongs_to  :medical_aid_plan

end
