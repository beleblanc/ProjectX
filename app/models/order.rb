class Order < ActiveRecord::Base
  attr_accessible :comments, :department_operation_id, :soaps_id, :time, :user_id


  belongs_to :department_operation
  belongs_to :soap

end
