class PersonMedicalAid < ActiveRecord::Base
  attr_accessible :person_id, :aid_number, :medical_aid_id, :status, :joinDate

  belongs_to :person, :foreign_key => :id
  has_one :medical_aid_plan, :foreign_key => :id

end
