class Consultation < ActiveRecord::Base
  attr_accessible :status, :time, :user_id, :person_id
  has_many :soaps
  belongs_to :person


end
