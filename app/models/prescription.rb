class Prescription < ActiveRecord::Base
  attr_accessible :comment, :pharmacy_inventory_id, :price, :soap_id, :time, :user_id
  belongs_to :pharmacy_inventory
  belongs_to :soap
end
