class MedicalAid < ActiveRecord::Base
  attr_accessible :name, :tel, :address, :fax, :email, :contact_person, :city, :province, :country,:medical_aid_plans_attributes
  has_many :medical_aid_plans
  accepts_nested_attributes_for :medical_aid_plans, :allow_destroy =>true
end
