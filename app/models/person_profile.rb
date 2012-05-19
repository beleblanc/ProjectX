class PersonProfile < ActiveRecord::Base
  attr_accessible :comments, :person_id, :time, :user_id
  belongs_to :person
  has_many :profile_items
  has_many :profile_sub_items
end
