class ChangeColumnDateTimeInWaitList < ActiveRecord::Migration
  def up
    change_column :wait_lists, :datetime_in, :datetime, :null => false
  end

  def down
    change_column :wait_lists, :datetime_in, :date, :null => false
  end
end
