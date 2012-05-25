class Dependency < ActiveRecord::Base
  attr_accessible :person_id, :dependent_id, :relation_id

  belongs_to :person
  belongs_to :dependent, :class_name => 'Person'

  def relationship
    Relation.find(self.relation_id).name
  end

end
