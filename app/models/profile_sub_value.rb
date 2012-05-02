class ProfileSubValue < ActiveRecord::Base
  attr_accessible :profile_id, :profile_sub_type_id, :value
  belongs_to :profile
  belongs_to :profile_sub_type
end
