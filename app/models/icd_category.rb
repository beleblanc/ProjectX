class IcdCategory < ActiveRecord::Base
  attr_accessible :name

  has_many :icds
end
