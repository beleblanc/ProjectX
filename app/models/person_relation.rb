class PersonRelation < ActiveRecord::Base
  attr_accessible :person1_id, :person2_id

  has_and_belongs_to_many :People
  has_and_belongs_to_many :People
  belongs_to :relation_type

end
