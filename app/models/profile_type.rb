class ProfileType < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :profile_items
  has_many :profile_sub_types
  has_many :profile_sub_items, :through => :profile_sub_types
end

