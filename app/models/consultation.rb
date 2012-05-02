class Consultation < ActiveRecord::Base
  attr_accessible :status, :time, :user_id, :wait_list_id
  has_many :soaps
  belongs_to :person


end
