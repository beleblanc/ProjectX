class Price < ActiveRecord::Base
  attr_accessible :medical_aid_id, :price
  belongs_to :priceable, :polymorphic => true
end
