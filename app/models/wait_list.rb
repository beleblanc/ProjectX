class WaitList < ActiveRecord::Base
  attr_accessible :datetime_in, :payment_type, :person_id, :next_action, :next_action_name, :attended

  has_one :consultation
  belongs_to :person

end