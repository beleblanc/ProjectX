class Order < ActiveRecord::Base
  attr_accessible :comments, :department_operation_id, :soaps_id, :time, :user_id
  attr_reader :department

  belongs_to :department_operation
  belongs_to :soap

  has_one :price, as: :priceable

end
