class Profile < ActiveRecord::Base

  attr_accessible :description, :person_id, :profile_type_id, :snapshot, :time, :user_id, :profile_sub_types_attributes, :profile_type_attributes

  belongs_to :person

  has_many :profile_type

  has_many :profile_sub_values, :through => :profile_type
  has_many :profile_sub_types, :through => :profile_type

  accepts_nested_attributes_for :profile_sub_values, :allow_destroy =>true
  accepts_nested_attributes_for :profile_type, :allow_destroy =>true

end
