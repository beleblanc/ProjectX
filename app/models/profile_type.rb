class ProfileType < ActiveRecord::Base
  attr_accessible :description, :name, :profile_sub_types_attributes, :profile_sub_items_attributes
  has_many :profile_items
  has_many :profile_sub_types
  has_many :profile_sub_items, :through => :profile_sub_types
  accepts_nested_attributes_for :profile_sub_types, :allow_destroy =>true
  accepts_nested_attributes_for :profile_sub_items, :allow_destroy =>true
end

