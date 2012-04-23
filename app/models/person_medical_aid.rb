class PersonMedicalAid < ActiveRecord::Base
  attr_accessible :person_id, :aid_number, :medical_aid_id, :status, :joinDate

  belongs_to :Person
  belongs_to :medical_aid

end
