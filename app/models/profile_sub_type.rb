class ProfileSubType < ActiveRecord::Base
  attr_accessible :description, :name, :profile_type_id
  belongs_to :profile_type
  has_many :profile_sub_items
end
