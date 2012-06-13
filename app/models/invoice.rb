class Invoice < ActiveRecord::Base
  has_many :orders
  belongs_to :person
end
