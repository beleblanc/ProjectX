class DepartmentOperation < ActiveRecord::Base
  attr_accessible :code, :department_id, :description, :name ,:prices_attributes

  has_many :orders

  has_many :prices, as: :priceable

  belongs_to :department

  def code_name
    "#{self.code}-#{self.name}"
  end

  accepts_nested_attributes_for :prices, :allow_destroy => true

end
