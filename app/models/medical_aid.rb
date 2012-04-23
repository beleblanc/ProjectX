class MedicalAid < ActiveRecord::Base
  attr_accessible :name, :tel, :address, :fax, :email, :contact_person, :city, :province, :country
  has_many :medical_aid_plans
end
