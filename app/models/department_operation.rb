class DepartmentOperation < ActiveRecord::Base
  attr_accessible :code, :department_id, :description, :name

  has_many :orders

  belongs_to :department

  def code_name
    "#{:code}-#{:name}"
  end


end
