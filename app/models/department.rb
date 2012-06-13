class Department < ActiveRecord::Base
  attr_accessible :description, :name, :staff_id
  has_many :department_operations

  def to_s
    self.name
  end
end
