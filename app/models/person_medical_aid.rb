class PersonMedicalAid < ActiveRecord::Base
  attr_accessible :person_id, :aid_number, :medical_aids_id, :status, :join_date

  belongs_to :person, :foreign_key => :id
  has_one  :medical_aid_plan, :foreign_key => :id,:primary_key => :medical_aids_id

end
