class Order < ActiveRecord::Base
  attr_accessible :comments, :department_operation_id, :soap_id, :time, :user_id, :price, :department
  attr_accessor :department

  belongs_to :department_operation
  belongs_to :soap



end
