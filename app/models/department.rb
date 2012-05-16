class Department < ActiveRecord::Base
  attr_accessible :description, :name, :staff_id
end
