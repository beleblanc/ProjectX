class Vital < ActiveRecord::Base
  attr_accessible :blood_pressure, :height, :pulse, :respiratory_rate, :soap_id, :temperature, :time, :weight

  belongs_to :soap
end
