class WaitList < ActiveRecord::Base
  attr_accessible :datetime_in, :payment_type, :people_id, :next_action, :next_action_name, :attended

  belongs_to :person

  has_one :consultation

end
