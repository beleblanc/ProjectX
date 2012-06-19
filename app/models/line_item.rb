class LineItem < ActiveRecord::Base
  belongs_to :invoice

  attr_accessible :invoice_id, :price_id, :quantity, :tax, :total, :unit_cost, :description
end
