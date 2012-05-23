class Relation < ActiveRecord::Base
  attr_accessible :name
  belongs_to :dependency
end
