class ProfileSubItem < ActiveRecord::Base
  attr_accessible :profile_item_id, :profile_sub_type_id, :time, :user_id, :value
  belongs_to :profile_item
  belongs_to :profile_sub_type
end
