class ProfileType < ActiveRecord::Base
  attr_accessible :name, :snapshot, :profile_sub_value_attributes, :profile_sub_types_attributes

  has_many :profiles

  has_many :profile_sub_types
  has_many :profile_sub_values, :through => :profile_sub_types

  accepts_nested_attributes_for :profile_sub_values, :allow_destroy =>true
  accepts_nested_attributes_for :profile_sub_types, :allow_destroy =>true
end