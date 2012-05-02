class DepartmentOperation < ActiveRecord::Base
  attr_accessible :code, :department_id, :description, :name

  has_many :orders

  belongs_to :department


end
