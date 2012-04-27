class WaitList < ActiveRecord::Base
  attr_accessible :datetime_in, :payment_type, :people, :next_action, :next_action_name, :attended
  belongs_to :people
end
