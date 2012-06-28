class PharmacyInventory < ActiveRecord::Base
  attr_accessible :description, :expiry_date, :name, :reorder_level, :stock_on_hand, :prices_attributes
  has_many :prices, as: :priceable
  accepts_nested_attributes_for :prices, :allow_destroy => true
end
