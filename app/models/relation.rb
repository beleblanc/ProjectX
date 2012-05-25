class Relation < ActiveRecord::Base
  attr_accessible :name
  belongs_to :dependency

  def to_s
    self.name
  end
  def relationship
    name
  end

end
