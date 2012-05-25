class PersonProfile < ActiveRecord::Base
  attr_accessible :comments, :person_id, :time, :user_id, :profile_items_attributes, :profile_sub_items_attributes

  belongs_to :person
  has_many :profile_items
  has_many :profile_sub_items
  has_many :profile_sub_types, :through => :profile_sub_items
  has_many :profile_types, :through => :profile_items

  accepts_nested_attributes_for :profile_items, :allow_destroy => true
  accepts_nested_attributes_for :profile_sub_items, :allow_destroy => true

end
