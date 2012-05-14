class ProfileSubItem < ActiveRecord::Base
  attr_accessible :person_profile_id, :profile_sub_type_id, :time, :user_id, :value
  belongs_to :person_profile
  belongs_to :profile_sub_type
end
