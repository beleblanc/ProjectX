class Department < ActiveRecord::Base
  attr_accessible :description, :name, :staff_id
  has_many :department_operations
end
