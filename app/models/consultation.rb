class Consultation < ActiveRecord::Base
  attr_accessible :status, :time, :user_id, :person_id, :soaps_attributes
  has_many :soaps
  has_many :orders, :through => :soaps
  belongs_to :person



  accepts_nested_attributes_for :soaps, :allow_destroy => true ,:reject_if => :all_blank

end
