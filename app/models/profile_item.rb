class ProfileItem < ActiveRecord::Base
  attr_accessible :person_profile_id, :profile_type_id, :time, :user_id, :value, :profile_sub_items_attributes
  belongs_to :person_profile
  belongs_to :profile_type

  has_many :profile_sub_types, :through => :profile_type
  has_many :profile_sub_items, :through => :person_profile

  accepts_nested_attributes_for :profile_sub_items
end
