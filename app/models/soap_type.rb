class SoapType < ActiveRecord::Base
  attr_accessible :instructions, :name
  has_many :soaps
end
