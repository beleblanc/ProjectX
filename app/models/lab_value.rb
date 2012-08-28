class LabValue < ActiveRecord::Base
   attr_accessible :name, :low_safe_range, :high_safe_range, :units
end
