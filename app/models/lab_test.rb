class LabTest < ActiveRecord::Base

  has_many :lab_values
  belongs_to :lab_order

  attr_accessible :code, :name, :short_code, :lab_values_attributes

  accepts_nested_attributes_for :lab_values, :allow_destroy => true
end
