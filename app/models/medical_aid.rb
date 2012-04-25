class MedicalAid < ActiveRecord::Base
  attr_accessible :name, :tel, :address, :fax, :email, :contact_person, :city, :province, :country ,:medical_aid_plans_attributes
  has_many :medical_aid_plan, :foreign_key => :medical_aids_id
  accepts_nested_attributes_for :medical_aid_plan
end
