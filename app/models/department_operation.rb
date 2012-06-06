class DepartmentOperation < ActiveRecord::Base
  attr_accessible :code, :department_id, :description, :name

  has_many :orders

  has_many :prices, as: :priceable

  belongs_to :department

  def code_name
    "#{self.code}-#{self.name}"
  end


end
