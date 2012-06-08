class AddColumnsToWaitList < ActiveRecord::Migration
  def change
    add_column :wait_lists, :medical_aid_plan_id, :integer
    add_column :consultations, :medical_aid_plan_id, :integer
  end
end
