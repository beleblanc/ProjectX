class Invoice < ActiveRecord::Base
  belongs_to :consultation
  belongs_to :person
  belongs_to :person_medical_aid
end
