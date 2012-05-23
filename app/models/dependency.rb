class Dependency < ActiveRecord::Base
  attr_accessible :person_id, :dependent_id, :relation_id

  belongs_to :person, :class_name => 'Person'
  belongs_to :dependent, :class_name => 'Person'
end
