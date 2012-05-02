class ProfileSubType < ActiveRecord::Base
  attr_accessible :description, :name, :profile_type_id, :validation
  belongs_to :profile_type
  has_many :profile_sub_values
end
