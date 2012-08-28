class Price < ActiveRecord::Base
  attr_accessible :medical_aid_plan_id, :price
  belongs_to :priceable, :polymorphic => true
  belongs_to :medical_aid_plan
end
