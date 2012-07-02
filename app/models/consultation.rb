class Consultation < ActiveRecord::Base

  attr_accessible :status, :time, :user_id, :person_id, :soaps_attributes, :medical_aid_plan_id,:wait_list_id
  attr_accessor :wait_list_id
  has_many :soaps
  has_many :orders, :through => :soaps
  has_many :prescriptions, :through => :soaps
  belongs_to :person
  has_many :invoices

  accepts_nested_attributes_for :soaps, :allow_destroy => true ,:reject_if => :all_blank

end
