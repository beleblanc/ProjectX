class Icd < ActiveRecord::Base
  attr_accessible :description, :icd_category_id

  has_many :diagnosises
  belongs_to :icd_category
end
